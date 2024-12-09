from dataclasses import dataclass, field
import os
from pathlib import Path
import json
from typing import IO, List


@dataclass
class XMgrCommandConfig:
    path: str = "xremap"
    prerun: str = ""
    postrun: str = ""
    
    @classmethod
    def from_dict(cls, d: dict) -> "XMgrCommandConfig":
        path = d.get("path") or XMgrCommandConfig.path
        prerun = d.get("prerun") or ""
        postrun = d.get("postrun") or ""
        return cls(path=path, prerun=prerun, postrun=postrun)


@dataclass
class XMgrDevicesConfig:
    include: List[str] = field(default_factory=list)
    ignore: List[str] = field(default_factory=list)
    
    @classmethod
    def from_dict(cls, d: dict) -> "XMgrDevicesConfig":
        include = d.get("include") or []
        ignore = d.get("ignore") or []
        return XMgrDevicesConfig(include=include, ignore=ignore)


@dataclass
class XMgrWatchConfig:
    device: bool = False
    config: bool = False
    
    @classmethod
    def from_dict(cls, d: dict) -> "XMgrWatchConfig":
        device = d.get("device") or False
        config = d.get("config") or False
        return XMgrWatchConfig(device=device, config=config)


@dataclass
class XMgrConfig:
    command: XMgrCommandConfig = field(default_factory=XMgrCommandConfig)
    layout: str = ""
    devices: XMgrDevicesConfig = field(default_factory=XMgrDevicesConfig)
    matchMice: bool = False
    watch: XMgrWatchConfig = field(default_factory=XMgrWatchConfig)
    
    @classmethod
    def from_dict(cls, d: dict) -> "XMgrConfig":
        command = d.get("command")
        if not isinstance(command, dict):
            raise TypeError("command is not a dictionary")
        command = XMgrCommandConfig.from_dict(command)
        layout = d.get("layout") or ""
        devices = d.get("devices")
        if not isinstance(devices, dict):
            raise TypeError("devices is not a dictionary")
        devices = XMgrDevicesConfig.from_dict(devices)
        matchMice = d.get("matchMice") or False
        watch = d.get("watch")
        if not isinstance(watch, dict):
            raise TypeError("watch is not a dictionary")
        watch = XMgrWatchConfig.from_dict(watch)
        return cls(
            command=command,
            layout=layout,
            devices=devices,
            matchMice=matchMice,
            watch=watch
        )
    
    @classmethod
    def json_loads(cls, s: str) -> "XMgrConfig":
        return cls.from_dict(json.loads(s))
    
    @classmethod
    def json_load(cls, f: IO) -> "XMgrConfig":
        return cls.from_dict(json.load(f))
    
    @classmethod
    def json_loadfp(cls, p: os.PathLike) -> "XMgrConfig":
        with Path(p).open("r") as f:
            return cls.json_load(f)