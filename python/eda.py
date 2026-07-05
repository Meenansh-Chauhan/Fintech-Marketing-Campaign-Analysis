"""
==========================================================
File:
eda.py

Objective:
Provide reusable exploratory data analysis (EDA)
functions for the Fintech Marketing Campaign Analysis
project.

This module contains statistical summaries and analytical
functions only. No visualizations are created here.

==========================================================
"""

import pandas as pd
from pandas import DataFrame


def dataset_overview(df: DataFrame) -> DataFrame:
    """
    Generate a high-level overview of the dataset.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
        Dataset overview including rows, columns,
        duplicate records, missing values and memory usage.
    """

    overview = pd.DataFrame({

        "Metric": [
            "Rows",
            "Columns",
            "Duplicate Rows",
            "Missing Values",
            "Memory Usage (MB)"
        ],

        "Value": [
            df.shape[0],
            df.shape[1],
            df.duplicated().sum(),
            df.isnull().sum().sum(),
            round(df.memory_usage(deep=True).sum() / (1024 ** 2), 2)
        ]

    })

    return overview


def numerical_summary(df: DataFrame) -> DataFrame:
    """
    Generate descriptive statistics for numerical columns.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    return df.describe().transpose()


def categorical_summary(df: DataFrame) -> DataFrame:
    """
    Generate summary statistics for categorical columns.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    return df.describe(include="object").transpose()


def conversion_statistics(df: DataFrame) -> DataFrame:
    """
    Compare numerical features between converted and
    non-converted customers.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    columns = [
        "age",
        "balance",
        "duration",
        "campaign",
        "previous"
    ]

    return (
        df
        .groupby("y")[columns]
        .mean()
        .round(2)
    )


def correlation_matrix(df: DataFrame) -> DataFrame:
    """
    Calculate correlation matrix for numerical variables.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    numeric_columns = df.select_dtypes(
        include=["number"]
    )

    return numeric_columns.corr()


def group_statistics(
    df: DataFrame,
    column: str
) -> DataFrame:
    """
    Generate conversion statistics for any categorical
    column.

    Parameters
    ----------
    df : pandas.DataFrame

    column : str
        Column name to analyze.

    Returns
    -------
    pandas.DataFrame
    """

    summary = (

        df
        .groupby(column)["y"]
        .value_counts()
        .unstack(fill_value=0)

    )

    summary["Conversion Rate (%)"] = (

        summary["yes"]
        / (summary["yes"] + summary["no"])
        * 100

    ).round(2)

    return summary.sort_values(
        by="Conversion Rate (%)",
        ascending=False
    )