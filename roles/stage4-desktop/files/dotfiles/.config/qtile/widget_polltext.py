"""Wrapper for GenPollText widget"""

import subprocess
from libqtile import widget
from dataclasses import dataclass


@dataclass
class Mode:
    name: str
    text: str
    color_bg: str
    color_fg: str


NAME_NA = "N/A"
NO_MODE = Mode(NAME_NA, NAME_NA, "#000000", "#ffffff")
DEBUG_ENABLED = False
DEBUG_FILE = "/tmp/widget.log"


class DebugLogger:
    name: str
    filename: str

    def __init__(self, name: str, filename: str):
        self.name = name
        self.filename = filename

    def log(self, text: str):
        if DEBUG_ENABLED:
            with open(self.filename, "a", encoding="utf-8") as f:
                f.write(f"{self.name} -> {text}\n")


class WidgetPollText(widget.GenPollText):
    """Performs command based polling to update state"""

    name: str
    command: str = ""
    modes: dict[str, Mode]
    current: Mode = NO_MODE
    update_interval: float = 1
    mouse_callbacks: dict
    max_chars: int = 64
    font_size: int = 11
    last_output: str = ""
    logger: DebugLogger
    _running: bool = False

    def __init__(
        self,
        name: str,
        command: str,
        modes: list[Mode],
        **config,
    ):
        """Initializes widget"""
        super().__init__(**config)
        self.logger = DebugLogger(name, DEBUG_FILE)
        self.name = name
        self.func = self.poll_function
        self.fmt = "{}"
        self.command = command
        self.fontsize = 16
        self.max_chars = 30
        self.modes = {x.name: x for x in modes}
        self.logger.log(f"__init__(): {self.name}")
        self._running = True

    def get_mode(self, name: str) -> Mode:
        """Get mode from predefined list"""
        result = NO_MODE
        result = self.modes.get(name, result)
        return result

    def get_state(self) -> str:
        """Fetch single state"""
        try:
            return subprocess.check_output(self.command, text=True, shell=True)
        except Exception as exe:
            self.logger.log(f"get_state() : {self.command} {exe}")
            return NAME_NA

    def update_state(self):
        """Updates widget properties to new state"""
        self.background = self.current.color_bg
        self.foreground = self.current.color_fg

    def set_state(self, newmode: Mode):
        """Sets new state"""
        self.current = newmode
        self.last_output = self.current.text
        self.update_state()

    def update_frame(self):
        """Called repeatedly to get the widget text."""
        self.last_output = NAME_NA
        self.last_output = self.get_state()
        self.last_output = self.last_output.strip()
        newmode = self.get_mode(self.last_output)
        self.set_state(newmode)
        return self.last_output

    def poll_function(self):
        """Called repeatedly to get the widget text."""
        try:
            if self._running:
                self.update_frame()
        except Exception as exe:
            self.last_output = NAME_NA
            self.logger.log(f"poll_function() : {exe}")
        self.logger.log(f"poll_function() : Returning {self.last_output}")
        self.update_frame()
        return self.last_output
