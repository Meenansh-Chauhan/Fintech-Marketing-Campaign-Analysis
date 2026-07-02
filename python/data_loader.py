"""
==========================================================
File:
data_loader.py

Objective:
Load and validate the Bank Marketing dataset before
performing analysis.

==========================================================
"""

import pandas as pd


def load_data(file_path):
    """
    Load the Bank Marketing dataset.

    Parameters
    ----------
    file_path : str
        Relative or absolute path to the CSV file.

    Returns
    -------
    pandas.DataFrame
        Loaded dataset.
    """

    df = pd.read_csv(file_path, sep=';')

    return df


def dataset_summary(df):
    """
    Display a high-level summary of the dataset.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    print("\n========== DATASET SUMMARY ==========")
    print(f"Rows    : {df.shape[0]}")
    print(f"Columns : {df.shape[1]}")


def check_data_types(df):
    """
    Display column names and data types.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    print("\n========== DATA TYPES ==========")
    print(df.dtypes)


def check_missing_values(df):
    """
    Display missing values for every column.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    pandas.Series
    """

    print("\n========== MISSING VALUES ==========")

    missing = df.isnull().sum()

    print(missing)

    return missing


def check_duplicates(df):
    """
    Count duplicate rows in the dataset.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    int
    """

    duplicates = df.duplicated().sum()

    print("\n========== DUPLICATE RECORDS ==========")
    print(f"Duplicate Rows : {duplicates}")

    return duplicates


def preview_data(df, rows=5):
    """
    Display the first few rows of the dataset.

    Parameters
    ----------
    df : pandas.DataFrame

    rows : int, default=5

    Returns
    -------
    pandas.DataFrame
    """

    print("\n========== DATA PREVIEW ==========")

    return df.head(rows)