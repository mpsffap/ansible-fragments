from libqtile import widget
import subprocess

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


class WidgetFortinet(widget.GenPollText):
    def __init__(self, **config):
        super().__init__(**config)
        self.func = self.poll_function
        self.fmt = "{}"
        self.markup = True
        self.max_chars = 64
        self.wrap = False
        self.fontsize = 11

    def parse_vpn_status(self, text: str) -> dict:
        data = {}

        for line in text.splitlines():
            line = line.strip()
            if not line or ":" not in line:
                continue

            key, value = line.split(":", 1)
            data[key.strip()] = value.strip()

        return data

    def poll_function(self):
        result = NAME_NA
        name = NAME_NA
        # ip = NAME_NA
        duration = NAME_NA
        cmd = f"forticlient vpn status {NAME_ADM}"
        proc = subprocess.run(cmd.split(" "), capture_output=True, text=True)
        proctext = f"{proc.stdout}{proc.stderr}"
        parsed = self.parse_vpn_status(proctext)
        if "Status" in parsed and parsed["Status"] == "Connected":
            check_connection = True
            name = parsed["VPN name"]
            # ip = parsed["IP"]
            duration = parsed["Duration"]
            result = f'<b>{name}</b><span color="{COLOR_WHITE}">\n{duration}</span>'
        else:
            check_connection = False

        if check_connection:
            if name in (NAME_ADM, NAME_SSL_ADM, NAME_SSO_ADM):
                new_background = COLOR_GREEN
                new_foreground = COLOR_BLACK
            elif name in (NAME_PUB):
                new_background = COLOR_LIGHTBLUE
                new_foreground = COLOR_WHITE
            else:
                new_background = COLOR_LIGHTBLUE
                new_foreground = COLOR_WHITE
        else:
            new_background = COLOR_RED
            new_foreground = COLOR_BLACK
        if self.foreground != new_foreground:
            self.foreground = new_foreground
        if self.background != new_background:
            self.background = new_background
        return result
