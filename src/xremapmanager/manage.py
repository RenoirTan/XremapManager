import sys
from pathlib import Path

from PySide6.QtCore import QObject, Signal, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

from xremapmanager._data import CONFIG_FP
from xremapmanager.config import XMgrConfig


class Backend(QObject):
    def __init__(self, root: QObject, config: XMgrConfig):
        super().__init__()
        self._root = root
        self._config = config
        self._root.setProperty("backend", self)
        self._root.setProperty("xrmpcfgCommandPath", self._config.command.path)
        self._root.setProperty("xrmpcfgCommandPrerun", self._config.command.prerun)
        self._root.setProperty("xrmpcfgCommandPostrun", self._config.command.postrun)
        self._root.setProperty("xrmpcfgLayout", self._config.layout)
        self._root.setProperty("xrmpcfgDevicesInclude", self._config.devices.include)
        self._root.setProperty("xrmpcfgDevicesIgnore", self._config.devices.ignore)
        self._root.setProperty("xrmpcfgMatchMice", self._config.matchMice)
        self._root.setProperty("xrmpcfgWatchDevice", self._config.watch.device)
        self._root.setProperty("xrmpcfgWatchConfig", self._config.watch.config)
    
    @Slot(dict)
    def submit(self, cfg):
        self._config.command.path = cfg["xrmpcfgCommandPath"]
        self._config.command.prerun = cfg["xrmpcfgCommandPrerun"]
        self._config.command.postrun = cfg["xrmpcfgCommandPostrun"]
        self._config.layout = cfg["xrmpcfgLayout"]
        self._config.devices.include = cfg["xrmpcfgDevicesInclude"]
        self._config.devices.ignore = cfg["xrmpcfgDevicesIgnore"]
        self._config.matchMice = cfg["xrmpcfgMatchMice"]
        self._config.watch.device = cfg["xrmpcfgWatchDevice"]
        self._config.watch.config = cfg["xrmpcfgWatchConfig"]


def main():
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Fusion")
    engine = QQmlApplicationEngine()
    engine.addImportPath(sys.path[0] or Path(__file__).parent) # xremapmanager/
    engine.loadFromModule("XrmpMgrUi", "Main")
    if not engine.rootObjects():
        sys.exit(-1)
    root = engine.rootObjects()[0]
    backend = Backend(root=root, config=XMgrConfig.json_loadfp(CONFIG_FP))
    exit_code = app.exec()
    del engine
    backend._config.json_dumpfp(CONFIG_FP)
    return exit_code


if __name__ == "__main__":
    main()