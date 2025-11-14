#!/usr/bin/env python3
from pathlib import Path
from typing import List


def get_bpn(pn_path: Path) -> str:
    """Returns base product name for given path

    Args:
        pn_path (Path): .bb or .bbappend file

    Returns:
        str: The base product name of the recipe
    """
    return pn_path.stem.split("_")[0]


def get_all_bb_files(base_path: Path) -> List[Path]:
    """Returns a list of all .bb and .bbappend files within a given path

    Args:
        base_path (Path): Base directory to search from

    Returns:
        List[Path]:
    """
    return list(base_path.rglob("*.bb*"))


def main() -> None:
    layer_dir = Path(__file__).resolve().parent.parent
    print(" ".join(sorted(map(get_bpn, get_all_bb_files(layer_dir)))))


if __name__ == "__main__":
    main()
