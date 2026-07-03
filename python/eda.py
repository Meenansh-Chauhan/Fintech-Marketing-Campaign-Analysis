"""
==========================================================
File:
eda.py

Objective:
Provide reusable exploratory data analysis (EDA)
functions for the Bank Marketing Campaign Analysis
project.

These functions perform statistical analysis only.
Visualization functions are implemented separately
in visualization.py.

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
        Dataset overview metrics.
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
            round(df.memory_usage(deep=True).sum() / 1024**2, 2)
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

    return df.describe().T


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

    categorical_columns = df.select_dtypes(include="object").columns

    summary = pd.DataFrame({
        "Unique Values": df[categorical_columns].nunique(),
        "Most Frequent": df[categorical_columns].mode().iloc[0],
        "Frequency": df[categorical_columns].apply(
            lambda x: x.value_counts().iloc[0]
        )
    })

    return summary


def conversion_statistics(df: DataFrame) -> DataFrame:
    """
    Compare numerical statistics between converted
    and non-converted customers.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    return (
        df.groupby("y")[["age", "balance", "duration", "campaign"]]
        .mean()
        .round(2)
    )


def correlation_matrix(df: DataFrame) -> DataFrame:
    """
    Compute the correlation matrix for numerical columns.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    numerical_df = df.select_dtypes(include=["int64", "float64"])

    return numerical_df.corr().round(2)


def group_statistics(df: DataFrame, column: str) -> DataFrame:
    """
    Generate customer counts and conversion rates
    for a categorical feature.

    Parameters
    ----------
    df : pandas.DataFrame

    column : str
        Column to analyze.

    Returns
    -------
    pandas.DataFrame
    """

    grouped = (
        df.groupby(column)
        .agg(
            total_customers=("y", "count"),
            converted_customers=("y", lambda x: (x == "yes").sum())
        )
        .reset_index()
    )

    grouped["conversion_rate_percentage"] = (
        grouped["converted_customers"]
        / grouped["total_customers"]
        * 100
    ).round(2)

    return grouped.sort_values(
        by="conversion_rate_percentage",
        ascending=False
    )


def numerical_missing_summary(df: DataFrame) -> DataFrame:
    """
    Summarize missing values for numerical columns.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    numerical_columns = df.select_dtypes(
        include=["int64", "float64"]
    ).columns

    missing = pd.DataFrame({
        "Missing Values": df[numerical_columns].isnull().sum(),
        "Missing Percentage": (
            df[numerical_columns]
            .isnull()
            .mean()
            * 100
        ).round(2)
    })

    return missing


def categorical_missing_summary(df: DataFrame) -> DataFrame:
    """
    Summarize missing values for categorical columns.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.DataFrame
    """

    categorical_columns = df.select_dtypes(
        include="object"
    ).columns

    missing = pd.DataFrame({
        "Missing Values": df[categorical_columns].isnull().sum(),
        "Missing Percentage": (
            df[categorical_columns]
            .isnull()
            .mean()
            * 100
        ).round(2)
    })

    return missing