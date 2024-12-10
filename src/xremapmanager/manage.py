import sys

from PySide6 import QtCore, QtWidgets, QtGui


class MyWidget(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        
        self.text = QtWidgets.QLabel("Hello World", alignment=QtCore.Qt.AlignCenter)
        self.button = QtWidgets.QPushButton("Click me!")
        
        self.layout = QtWidgets.QVBoxLayout(self)
        self.layout.addWidget(self.text)
        self.layout.addWidget(self.button)


def main():
    app = QtWidgets.QApplication([])
    widget = MyWidget()
    widget.resize(800, 800)
    widget.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()