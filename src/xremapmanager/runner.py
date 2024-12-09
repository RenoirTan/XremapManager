import shutil
import subprocess

from xremapmanager._data import CONFIG_FP, DEFAULT_CONFIG_FP
from xremapmanager.config import XMgrConfig


def main():
    if not CONFIG_FP.exists():
        shutil.copy2(DEFAULT_CONFIG_FP, CONFIG_FP)
    config = XMgrConfig.json_loadfp(CONFIG_FP)
    subprocess.run([config.command.path, config.layout])