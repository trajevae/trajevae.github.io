import argparse
import shutil
from pathlib import Path

TYPE_FILES = {
    "several": [
        "walkdog-S9-1525-1626_17",
        "directions-S9-2175-2276_17",
        "greeting_2-S11-400-501_17",
        "smoking-S9-3475-3576_17",
        "walktogether_1-S11-225-326_17",
    ],
    "single": ["walking-S9-0-101_17", "eating-S9-2050-2151_17"],
    "diff": [
        "discussion_2-S9-325-426_17_0",
        "greeting-S9-525-626_17_0",
        "greeting-S9-1300-1401_17_0",
        "smoking-S9-0-101_17_0",
        "walkdog_1-S9-1200-1301_17_0",
        "walktogether_1-S9-1050-1151_17_0",
    ],
}


def remove_files(in_folder: str, data_type: str):
    files_to_hold = TYPE_FILES[data_type]

    for movie in Path(in_folder).rglob("*.mp4"):
        if all(name not in movie.parent.as_posix() for name in files_to_hold):
            movie.unlink()

    for path in Path(in_folder).rglob("*"):
        if path.is_dir() and len(list(path.rglob("*.mp4"))) == 0:
            shutil.rmtree(path.as_posix())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("in_folder")
    parser.add_argument("type", choices=["single", "several", "diff"])

    args = parser.parse_args()

    remove_files(args.in_folder, args.type)


if __name__ == "__main__":
    main()
