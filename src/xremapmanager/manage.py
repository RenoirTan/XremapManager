import argparse
import multiprocessing
import time
import webbrowser

from flask import Flask, render_template, request
import waitress

from xremapmanager._data import CONFIG_FP
from xremapmanager.config import XMgrConfig


def create_app() -> Flask:
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY="test",
    )
    
    @app.route("/", methods=["GET", "POST"])
    def index():
        config = XMgrConfig.json_loadfp(CONFIG_FP)
        return render_template("index.html", xrmpcfg=config)
    
    return app


# Workaround. Delays the request for flask to start
def open_browser(url: str, delay_ms: int = 500):
    time.sleep(delay_ms / 1000)
    webbrowser.open(url)


def main():
    arg_parser = argparse.ArgumentParser(
        prog="xrmp-manage",
        description="Manage Xremap"
    )
    arg_parser.add_argument(
        "-H",
        "--host",
        default="127.0.0.1",
        help="Host to bind to"
    )
    arg_parser.add_argument(
        "-P",
        "--port",
        default=8000,
        type=int,
        help="Port to bind to"
    )
    args = arg_parser.parse_args()
    app = create_app()
    p = multiprocessing.Process(target=open_browser, args=(f"http://{args.host}:{args.port}/",))
    p.start()
    waitress.serve(app, host=args.host, port=args.port)
    p.join()