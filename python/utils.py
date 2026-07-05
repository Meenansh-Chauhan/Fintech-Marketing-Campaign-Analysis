"""
==========================================================
File:
utils.py

Objective:
Provide reusable helper functions for the Fintech
Marketing Campaign Analysis project.

These functions support data validation and notebook
execution but do not perform analysis or visualization.

==========================================================
"""

from pathlib import Path
import os


def project_root() -> Path:
    """
    Return the project's root directory.

    Returns
    -------
    pathlib.Path
    """

    return Path(__file__).resolve().parent.parent


def ensure_directories() -> None:
    """
    Ensure all required visualization directories exist.

    Returns
    -------
    None
    """

    directories = [

        project_root() / "visuals",

        project_root() / "visuals" / "comparisons",

        project_root() / "visuals" / "correlations",

        project_root() / "visuals" / "distributions",

        project_root() / "visuals" / "dashboard_exports"

    ]

    for directory in directories:

        directory.mkdir(
            parents=True,
            exist_ok=True
        )


def separator(title: str = "") -> None:
    """
    Print a formatted section separator.

    Parameters
    ----------
    title : str

    Returns
    -------
    None
    """

    print("\n" + "=" * 60)

    if title:

        print(title)

        print("=" * 60)


def file_exists(file_path: str) -> bool:
    """
    Check whether a file exists.

    Parameters
    ----------
    file_path : str

    Returns
    -------
    bool
    """

    return os.path.isfile(file_path)