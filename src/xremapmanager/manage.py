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
    
    @Slot(dict)
    def submit(self, cfg):
        print(f"{cfg=}")


def main():
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Material")
    engine = QQmlApplicationEngine()
    engine.addImportPath(sys.path[0] or Path(__file__).parent) # xremapmanager/
    engine.loadFromModule("XrmpMgrUi", "Main")
    if not engine.rootObjects():
        sys.exit(-1)
    root = engine.rootObjects()[0]
    backend = Backend(root=root, config=XMgrConfig.json_loadfp(CONFIG_FP))
    exit_code = app.exec()
    del engine
    return exit_code


if __name__ == "__main__":
    main()