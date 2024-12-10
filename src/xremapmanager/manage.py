import sys
from pathlib import Path

from PySide6.QtCore import QObject, Signal, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

from xremapmanager._data import CONFIG_FP
from xremapmanager.config import XMgrConfig


class Backend(QObject):
    def __init__(self):
        super().__init__()
    
    @Slot(dict)
    def submit(self, cfg):
        print(f"{cfg=}")


def main():
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Material")
    engine = QQmlApplicationEngine()
    backend = Backend()
    engine.addImportPath(sys.path[0] or Path(__file__).parent) # xremapmanager/
    engine.loadFromModule("XrmpMgrUi", "Main")
    if not engine.rootObjects():
        sys.exit(-1)
    root = engine.rootObjects()[0]
    root.setProperty("backend", backend)
    cfg = XMgrConfig.json_loadfp(CONFIG_FP)
    root.setProperty("xrmpcfgCommandPath", cfg.command.path)
    exit_code = app.exec()
    del engine
    return exit_code


if __name__ == "__main__":
    main()