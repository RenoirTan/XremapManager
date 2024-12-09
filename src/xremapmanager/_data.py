import os
from pathlib import Path

VERSION = "0.1.0"
PREFIX_DIR = Path("/usr")
BIN_DIR = Path("/usr/bin")
DATA_DIR = Path("/usr/share")
CONFIG_DIR = Path(os.environ.get("XDG_CONFIG_HOME") or (Path.home() / ".config"))

DEFAULT_CONFIG_FP = DATA_DIR / "xremapmanager.json"
CONFIG_FP = CONFIG_DIR / "xremapmanager.json"