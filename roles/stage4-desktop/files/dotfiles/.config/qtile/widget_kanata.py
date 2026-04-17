"""Shows Kanata modes"""

from widget_polltext import Mode
from widget_pollfile import WidgetPollFile
from colors import lightRed, lightGreen, lightBlue, lightViolet, lightGray, fontBlack

DEFAULT_KANATA_MODES = [
    Mode("Base", "󰦑", lightGreen, fontBlack),
    Mode("Layers", "󰒿", lightViolet, fontBlack),
    Mode("Arrows", "󰁌", lightBlue, fontBlack),
    Mode("Mouse", "󰍽", lightBlue, fontBlack),
    Mode("App", "󰀻", lightRed, fontBlack),
    Mode("Macro", "󰮫", lightRed, fontBlack),
    Mode("Inactive", "󰿊", lightGray, fontBlack),
]
# DEFAULT_KANATA_MODES_FG = [
#     Mode("Base", "󰦑", fontBlack, lightGreen),
#     Mode("Layers", "󰒿", fontBlack, lightGreen),
#     Mode("Arrows", "󰁌", fontBlack, lightBlue),
#     Mode("Mouse", "󰍽", fontBlack, lightBlue),
#     Mode("App", "󰀻", fontBlack, lightRed),
#     Mode("Macro", "󰮫", fontBlack, lightRed),
#     Mode("Inactive", "󰿊", fontBlack, lightGray),
# ]


class WidgetKanata(WidgetPollFile):
    """Polls file to update kanata state"""

    def __init__(
        self,
        name: str,
        file: str,
        modes: list[Mode] = DEFAULT_KANATA_MODES,
        **kwargs,
    ):
        super().__init__(name, file, modes, **kwargs)
