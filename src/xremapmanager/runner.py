import asyncio
import shutil
import subprocess
import sys

from xremapmanager._data import CONFIG_FP, DEFAULT_CONFIG_FP
from xremapmanager.config import XMgrConfig


async def get_runner(process: subprocess.Popen):
    return process.wait()


async def _inner_main():
    if not CONFIG_FP.exists():
        shutil.copy2(DEFAULT_CONFIG_FP, CONFIG_FP)
    config = XMgrConfig.json_loadfp(CONFIG_FP)
    process = subprocess.Popen([config.command.path, config.layout])
    runner = get_runner(process)
    retval = await runner
    return retval or 0


def main():
    sys.exit(asyncio.run(_inner_main()))