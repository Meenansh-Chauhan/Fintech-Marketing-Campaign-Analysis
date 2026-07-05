"""
==========================================================
File:
visualization.py

Objective:
Generate and save visualizations for the Fintech
Marketing Campaign Analysis project.

All visualizations are automatically exported to the
appropriate folder inside the visuals directory.

==========================================================
"""

import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame

# --------------------------------------------------------
# Global Visualization Settings
# --------------------------------------------------------

plt.style.use("default")

sns.set_theme(
    style="whitegrid",
    palette="deep"
)

FIGURE_SIZE = (10, 6)

IMAGE_DPI = 300

def plot_conversion_distribution(df: DataFrame):
    """
    Plot customer conversion distribution.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=FIGURE_SIZE)

    sns.countplot(
        data=df,
        x="y"
    )

    plt.title("Customer Conversion Distribution")

    plt.xlabel("Campaign Outcome")

    plt.ylabel("Number of Customers")

    plt.tight_layout()

    plt.savefig(
        "../visuals/comparisons/conversion_distribution.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()

def plot_age_distribution(df: DataFrame):
    """
    Plot age distribution of customers.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=FIGURE_SIZE)

    plt.hist(
        df["age"],
        bins=20,
        edgecolor="black"
    )

    plt.title("Customer Age Distribution")

    plt.xlabel("Age")

    plt.ylabel("Number of Customers")

    plt.tight_layout()

    plt.savefig(
        "../visuals/distributions/age_distribution.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()


def plot_balance_distribution(df: DataFrame):
    """
    Plot account balance distribution.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=FIGURE_SIZE)

    plt.hist(
        df["balance"],
        bins=30,
        edgecolor="black"
    )

    plt.title("Account Balance Distribution")

    plt.xlabel("Account Balance")

    plt.ylabel("Number of Customers")

    plt.tight_layout()

    plt.savefig(
        "../visuals/distributions/balance_distribution.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()

def plot_duration_distribution(df: DataFrame):
    """
    Plot call duration distribution.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=FIGURE_SIZE)

    plt.hist(
        df["duration"],
        bins=30,
        edgecolor="black"
    )

    plt.title("Call Duration Distribution")

    plt.xlabel("Duration (Seconds)")

    plt.ylabel("Number of Customers")

    plt.tight_layout()

    plt.savefig(
        "../visuals/distributions/duration_distribution.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()

def plot_campaign_distribution(df: DataFrame):
    """
    Plot distribution of contact attempts.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=FIGURE_SIZE)

    plt.hist(
        df["campaign"],
        bins=20,
        edgecolor="black"
    )

    plt.title("Campaign Contact Attempts Distribution")

    plt.xlabel("Number of Contact Attempts")

    plt.ylabel("Number of Customers")

    plt.tight_layout()

    plt.savefig(
        "../visuals/distributions/campaign_distribution.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()

def plot_balance_boxplot(df: DataFrame):
    """
    Plot account balance distribution by campaign outcome.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=FIGURE_SIZE)

    sns.boxplot(
        data=df,
        x="y",
        y="balance"
    )

    plt.title("Account Balance by Campaign Outcome")

    plt.xlabel("Campaign Outcome")

    plt.ylabel("Account Balance")

    plt.tight_layout()

    plt.savefig(
        "../visuals/comparisons/balance_boxplot.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()

def plot_duration_boxplot(df: DataFrame):
    """
    Plot call duration distribution by campaign outcome.

    Parameters
    ----------
    df : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=FIGURE_SIZE)

    sns.boxplot(
        data=df,
        x="y",
        y="duration"
    )

    plt.title("Call Duration by Campaign Outcome")

    plt.xlabel("Campaign Outcome")

    plt.ylabel("Duration (Seconds)")

    plt.tight_layout()

    plt.savefig(
        "../visuals/comparisons/duration_boxplot.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()

def plot_correlation_heatmap(correlation_matrix: DataFrame):
    """
    Plot correlation heatmap for numerical variables.

    Parameters
    ----------
    correlation_matrix : pandas.DataFrame

    Returns
    -------
    None
    """

    plt.figure(figsize=(10, 8))

    sns.heatmap(
        correlation_matrix,
        annot=True,
        cmap="coolwarm",
        linewidths=0.5,
        fmt=".2f"
    )

    plt.title("Correlation Heatmap")

    plt.tight_layout()

    plt.savefig(
        "../visuals/correlations/correlation_heatmap.png",
        dpi=IMAGE_DPI,
        bbox_inches="tight"
    )

    plt.show()

    plt.close()