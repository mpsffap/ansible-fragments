"""Wrapper for WidgetPollText"""

from widget_polltext import Mode, WidgetPollText


class WidgetPollFile(WidgetPollText):
    """Performs file based polling to update state"""

    def __init__(self, name: str, file: str, modes: list[Mode], **kwargs):
        super().__init__(name, f"cat {file}", modes, **kwargs)
