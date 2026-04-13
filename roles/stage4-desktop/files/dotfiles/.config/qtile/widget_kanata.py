from libqtile import widget
import subprocess
from dataclasses import dataclass

FORTICLIENT_WIDGET = None
NAME_NA = "N/A"
NAME_ADM = "bks-adm"
NAME_SSL_ADM = f"SSL {NAME_ADM}"
NAME_SSO_ADM = f"{NAME_ADM} SSO"
NAME_PUB = "pub-all"
COLOR_LIGHTBLUE = "#0041C2"
COLOR_GREEN = "#175229"
COLOR_RED = "#ff7f7f"
COLOR_BLACK = "#000000"
COLOR_WHITE = "#ffffff"


@dataclass
class Mode:
    name: str
    text: str
    color_bg: str
    color_fg: str


FILENAME = "/tmp/kanata.state"
NO_MODE = Mode("N/A", "N/A", "#000000", "#ffffff")


class WidgetKanata(widget.GenPollText):
    command: str = ""
    modes: dict[str, Mode]
    current: Mode = NO_MODE
    update_interval: float = 1
    max_chars: int = 64
    font_size: int = 11

    def __init__(
        self,
        command: str,
        modes: list[Mode],
        update_interval: float,
        max_chars: int,
        fontsize: int,
        **config,
    ):
        super().__init__(**config)
        self.func = self.poll_function
        self.fmt = "{}"
        self.markup = True
        self.update_interval = update_interval
        self.max_chars = max_chars
        self.wrap = False
        self.fontsize = fontsize
        self.command = command
        self.modes = {x.name: x for x in modes}

    def get_mode(self, name: str) -> Mode:
        result = Mode("N/A", "N/A", "#000000", "#ffffff")
        return self.modes.get(name, result)

    def poll_function(self):
        """Called repeatedly to get the widget text."""
        try:
            output = subprocess.check_output(self._cmd, text=True, shell=True)
            output = output.strip()
            newmode = self.get_mode(output)
            if self.current != newmode:
                self.current = newmode
                self.background = self.current.color_bg
                self.foreground = self.current.color_fg
        except Exception:
            output = "N/A"

        return self.current.text
