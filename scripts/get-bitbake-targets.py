#!/usr/bin/env python3
from argparse import ArgumentParser
from itertools import chain
from pathlib import Path
from typing import List, Optional


def get_bpn(pn_path: Path) -> str:
    """Returns base product name for given path

    Args:
        pn_path (Path): .bb or .bbappend file

    Returns:
        str: The base product name of the recipe
    """
    return pn_path.stem.split("_")[0]


def get_associated_bpns(modified_file: Path) -> List[str]:
    """Gets all BPNs that are likely associated with a modified file

    Args:
        modified_file (Path): Path to modified file

    Returns:
        List[str]: One more BPNs that are associated with the modified file
    """
    search_dir = (
        modified_file.parent
        if modified_file.suffix in (".bb", ".bbappend", ".inc")
        else modified_file.parent.parent
    )
    return list(map(get_bpn, search_dir.glob("*.bb*")))


def get_modified_bpns(modified_files: List[Path]) -> List[str]:
    """Gets all BPNs that are associated with a list of modified files.

    Args:
        modified_files (List[Path]): List of files that have been modified.

    Returns:
        List[str]: All BPNs that are associated with the modified file.
    """
    # We should be safe and build everything if a .conf or .bbclass file is modified
    if any(
        filter(
            lambda x: x.suffix in (".conf", ".bbclass"),
            modified_files,
        )
    ):
        return get_all_bpns()
    # Otherwise get all possibly modified recipe BPNs
    return sorted(list(set(chain(*map(get_associated_bpns, modified_files)))))


def get_all_bpns() -> List[str]:
    """Returns all BPNs found in the layer.

    Returns:
        List[str]: List of all BPNs found in the layer.
    """
    layer_dir = Path(__file__).resolve().parent.parent
    return sorted(list(map(get_bpn, layer_dir.rglob("*.bb*"))))


def get_bpns(modified_files: Optional[List[Path]] = None) -> List[str]:
    """Either gets a list of all the BPNs in the layer, or just the BPNs that are associated with modified files.

    Args:
        modified_files (Optional[List[Path]], optional): Files that have been modified. Defaults to None.

    Returns:
        List[str]: All BPNs in the layer, or all associated BPNs if modified files are provided
    """
    return get_modified_bpns(modified_files) if modified_files else get_all_bpns()


def main() -> None:
    parser = ArgumentParser("Gets bitbake targets to build")
    parser.add_argument(
        "changed_files",
        nargs="*",
        type=Path,
        help="Files that were modified. "
        "If files are included in the command, only modified BPNs will be returned. "
        "If no files are supplied, all BPNs in the layer will be returned.",
    )

    args = parser.parse_args()

    print(" ".join(get_bpns(getattr(args, "changed_files", None))))


if __name__ == "__main__":
    main()
