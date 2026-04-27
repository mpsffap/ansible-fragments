from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy

from widget_forticlient import WidgetFortinet
from widget_kanata import WidgetKanata

# from helpers import normalize_window_title
from globals import (
    tm,
    bb,
    ff,
    ev,
    ge,
    gi,
    nv,
    fm,
    update,
    barBorderWidth,
    opacityBar,
    marginBar,
)
from colors import (
    fontWhite,
    fontYellow,
    fontBlack,
    lightRed,
    lightBlue,
    darkBlue,
    darkGray,
    barColor,
    barBorderColor,
)

FONTSIZE = 20
FONTSIZE_SMALL = 20
BAR_HEIGHT = 30
SECOND_SCREEN = True
NAME_NA = "N/A"
NAME_ADM = "bks-adm"
NAME_SSL_ADM = f"SSL {NAME_ADM}"
NAME_SSO_ADM = f"{NAME_ADM} SSO"
NAME_PUB = "pub-all"
FILE_KANATA_STATE = "/tmp/kanata.state"
widgetconf = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=FONTSIZE,
    padding=7,
)
extconf = widgetconf.copy()
widget_config_top_primary: dict[str, bool] = {
    "widgets_top_primary_window_name": True,
}
widget_config_bottom_primary: dict[str, bool] = {
    "widgets_bottom_primary_layout_icon": True,
    "widgets_bottom_primary_window_count": True,
    "widgets_bottom_primary_groupbox": True,
    "widgets_bottom_primary_prompt": True,
    "widgets_bottom_primary_widgetbox_buttons": True,
    "widgets_bottom_primary_clipboard": True,
    "widgets_bottom_primary_net": True,
    "widgets_bottom_primary_systray": True,
    "widgets_bottom_primary_battery": True,
    "widgets_bottom_primary_forticlient": True,
    "widgets_bottom_primary_kanata": True,
    "widgets_bottom_primary_updater": True,
    "widgets_bottom_primary_clock": True,
}
widget_config_top_secondary: dict[str, bool] = {
    "widgets_top_secondary_window_name": True,
}
widget_config_bottom_secondary: dict[str, bool] = {
    "widgets_bottom_secondary_layout_icon": True,
    "widgets_bottom_secondary_window_count": True,
    "widgets_bottom_secondary_groupbox": True,
    "widgets_bottom_secondary_prompt": True,
    "widgets_bottom_secondary_widgetbox_buttons": True,
    "widgets_bottom_secondary_clipboard": True,
    "widgets_bottom_secondary_net": True,
    "widgets_bottom_secondary_systray": True,
    "widgets_bottom_secondary_battery": True,
    "widgets_bottom_secondary_forticlient": True,
    "widgets_bottom_secondary_kanata": True,
    "widgets_bottom_secondary_updater": True,
    "widgets_bottom_secondary_clock": True,
}
widgets_top_primary: list = []
widgets_bottom_primary: list = []
widgets_top_secondary: list = []
widgets_bottom_secondary: list = []
icons_static: dict[str, str] = {
    "brave": "/usr/share/icons/hicolor/128x128/apps/brave-browser.png",
    "firefox": "/usr/share/icons/hicolor/128x128/apps/firefox-esr.png",
    "kitty": "/usr/share/icons/hicolor/256x256/apps/kitty.png",
    "gedit": "/usr/share/icons/gnome/256x256/apps/accessories-text-editor.png",
    "nvim": "/usr/share/icons/hicolor/128x128/apps/nvim.png",
    "thunar": "/usr/share/icons/hicolor/128x128/apps/org.xfce.thunar.png",
    "mumble": "/usr/share/icons/hicolor/scalable/apps/mumble.svg",
    "gimp": "/usr/share/icons/hicolor/256x256/apps/gimp.png",
    "evince": "/usr/share/icons/hicolor/scalable/apps/org.gnome.Evince.svg",
    "gparted": "/usr/share/icons/hicolor/scalable/apps/gparted.svg",
    "zoom": "/usr/share/pixmaps/application-x-zoom.png",
}


###############################################################################
# Widgets
###############################################################################
def create_widget_groupbox():
    return widget.GroupBox(
        hide_unused=False,
        disable_drag=True,
        rounded=False,
        active=fontWhite,
        inactive=fontYellow,
        urgent_text=fontBlack,
        urgent_border=lightRed,
        urgent_alert_method="block",
        font="JetBrainsMono Nerd Font",
        fontsize=FONTSIZE,
        highlight_method="line",
        highlight_color=lightBlue,
        this_current_screen_border=darkBlue,
        other_current_screen_border=darkBlue,
        padding=1,
    )


def create_widget_updater():
    return widget.CheckUpdates(
        distro="Debian",
        markup=True,
        colour_have_updates="ff0000",
        colour_no_updates="00ff00",
        display_format="({updates})",
        no_update_string="(0)",
        execute=f"{tm} --title Update --hold {update}",
    )


def create_widget_clock():
    return widget.Clock(
        **widgetconf,
        mouse_callbacks={
            "Button1": lazy.spawn("gsimplecal"),
        },
        format="%Y-%m-%d %a %H:%M:%S",
    )


def create_widget_battery():
    upower = "upower -i $(upower -e | grep BAT) "
    grep = 'grep --color=never -E "state|to\\ full|to\\ empty|percentage"'
    cmd = f"kitty bash -c '{upower} | {grep} ; sleep 2'"
    return widget.Battery(
        font="JetBrainsMono Nerd Font",
        fontsize=10,
        notify_below=0.2,
        low_percentage=0.1,
        low_foreground="#FF0000",
        low_background="#FFFFFF",
        foreground="#FFFFFF",
        charge_char="C",
        discharge_char="D",
        scale=1,
        battery=0,
        background="#175229",
        update_interval=1,
        show_short_text=True,
        format="{percent:2.0%}\n{watt:.2f} W",
        mouse_callbacks={"Button1": lazy.spawn(cmd)},
    )


def create_widgetImage(icon: str, app: str):
    cb = {"Button1": lazy.spawn(app)}
    filename = icons_static[icon]
    return widget.Image(scale=True, filename=filename, mouse_callbacks=cb)


def create_widgetbox_buttons():
    return widget.WidgetBox(
        text_open="",
        text_closed="",
        start_opened=True,
        close_button_location="right",
        widgets=[
            widget.Spacer(),
            widget.Sep(padding=10, linewidth=5, size_percent=50),
            create_widgetImage("brave", bb),
            create_widgetImage("firefox", ff),
            create_widgetImage("kitty", tm),
            create_widgetImage("thunar", fm),
            create_widgetImage("nvim", nv),
            create_widgetImage("gedit", ge),
            create_widgetImage("evince", ev),
            create_widgetImage("gimp", gi),
            widget.Sep(padding=10, linewidth=5, size_percent=50),
        ],
    )


def create_widgetbox_clipboard():
    return widget.WidgetBox(
        text_open="[c]",
        text_closed="[C]",
        close_button_location="right",
        widgets=[widget.Clipboard(timeout=0)],
    )


def create_widgetbox_net():
    return widget.WidgetBox(
        text_open="[n]",
        text_closed="[N]",
        start_opened=False,
        close_button_location="right",
        widgets=[
            widget.Net(),
            widget.ThermalZone(),
        ],
    )


def create_widgetbox_forticlient():
    return WidgetFortinet(
        name="FortinetWidget",
        update_interval=2,
        fmt="{}",
        mouse_callbacks={
            "Button1": lazy.spawn("forticlient gui"),
            "Button3": lazy.spawn(
                (
                    f"forticlient vpn disconnect {NAME_SSO_ADM} & "
                    f"forticlient vpn disconnect {NAME_SSL_ADM} & "
                    f"forticlient vpn disconnect {NAME_PUB} & "
                )
            ),
        },
    )


def create_widgetbox_kanata():
    return WidgetKanata(
        name="aaa",
        file=FILE_KANATA_STATE,
        max_chars=64,
        fontsize=11,
        update_interval=0.5,
        fmt="{}",
        mouse_callbacks={},
    )


def create_widget_layout_icon():
    return widget.CurrentLayout(**widgetconf, background=darkGray)


def create_widget_window_name():
    return widget.WindowName(width=bar.CALCULATED)


def create_widget_prompt():
    return widget.Prompt(prompt="Spawn: ")


###############################################################################
# Bars
###############################################################################
def build_widgetlist(cfg, widget_map: list[tuple]) -> list:
    widgets = []
    for key, factory in widget_map:
        if key.endswith("_sep"):
            widgets.append(factory())
        elif key.endswith("_spacer"):
            widgets.append(factory())
        elif cfg.get(key):
            widgets.append(factory())
    return widgets


def create_bar_top_primary(cfg):
    widgets_top_primary = [
        ("widgets_top_primary_sep", widget.Sep),
        ("widgets_top_primary_spacer", widget.Spacer),
        ("widgets_top_primary_window_name", create_widget_window_name),
        ("widgets_top_primary_spacer", widget.Spacer),
        ("widgets_top_primary_sep", widget.Sep),
    ]
    return build_widgetlist(cfg, widgets_top_primary)


def create_bar_bottom_primary(cfg):
    widgets_bottom_primary = [
        ("widgets_bottom_primary_layout_icon", create_widget_layout_icon),
        ("widgets_bottom_primary_window_count", widget.WindowCount),
        ("widgets_bottom_primary_groupbox", create_widget_groupbox),
        ("widgets_bottom_primary_sep", widget.Sep),
        ("widgets_bottom_primary_prompt", create_widget_prompt),
        ("widgets_bottom_primary_widgetbox_buttons", create_widgetbox_buttons),
        ("widgets_bottom_primary_spacer", widget.Spacer),
        ("widgets_bottom_primary_sep", widget.Sep),
        ("widgets_bottom_primary_clipboard", create_widgetbox_clipboard),
        ("widgets_bottom_primary_net", create_widgetbox_net),
        ("widgets_bottom_primary_sep", widget.Sep),
        ("widgets_bottom_primary_systray", widget.Systray),
        ("widgets_bottom_primary_battery", create_widget_battery),
        ("widgets_bottom_primary_sep", widget.Sep),
        ("widgets_bottom_primary_forticlient", create_widgetbox_forticlient),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_primary_kanata", create_widgetbox_kanata),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_primary_updater", create_widget_updater),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_primary_clock", create_widget_clock),
    ]

    return build_widgetlist(cfg, widgets_bottom_primary)


def create_bar_top_secondary(cfg):
    widgets_top_secondary = [
        ("widgets_top_secondary_sep", widget.Sep),
        ("widgets_top_secondary_spacer", widget.Spacer),
        ("widgets_top_secondary_window_name", create_widget_window_name),
        ("widgets_top_secondary_spacer", widget.Spacer),
        ("widgets_top_secondary_sep", widget.Sep),
    ]
    return build_widgetlist(cfg, widgets_top_secondary)


def create_bar_bottom_secondary(cfg):
    widgets_bottom_secondary = [
        ("widgets_bottom_secondary_layout_icon", create_widget_layout_icon),
        ("widgets_bottom_secondary_groupbox", create_widget_groupbox),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_secondary_widgetbox_buttons", create_widgetbox_buttons),
        ("widgets_bottom_secondary_spacer", widget.Spacer),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_secondary_clipboard", create_widgetbox_clipboard),
        ("widgets_bottom_secondary_net", create_widgetbox_net),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_secondary_battery", create_widget_battery),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_secondary_forticlient", create_widgetbox_forticlient),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_secondary_kanata", create_widgetbox_kanata),
        ("widgets_bottom_secondary_sep", widget.Sep),
        ("widgets_bottom_secondary_clock", create_widget_clock),
    ]
    return build_widgetlist(cfg, widgets_bottom_secondary)


###############################################################################
# Screens
###############################################################################


class MpsScreens(object):
    def init_screens(self):
        screenlist = [
            Screen(
                top=bar.Bar(
                    create_bar_top_primary(widget_config_top_primary),
                    BAR_HEIGHT,
                    border_color=barBorderColor,
                    border_width=barBorderWidth,
                    background=barColor,
                    margin=marginBar,
                    opacity=opacityBar,
                ),
                bottom=bar.Bar(
                    create_bar_bottom_primary(widget_config_bottom_primary),
                    BAR_HEIGHT,
                    border_color=barBorderColor,
                    border_width=barBorderWidth,
                    background=barColor,
                    margin=marginBar,
                    opacity=opacityBar,
                ),
            ),
        ]
        if SECOND_SCREEN:
            screenlist.append(
                Screen(
                    top=bar.Bar(
                        create_bar_top_secondary(widget_config_top_secondary),
                        BAR_HEIGHT,
                        border_color=barBorderColor,
                        border_width=barBorderWidth,
                        background=barColor,
                        margin=marginBar,
                        opacity=opacityBar,
                    ),
                    bottom=bar.Bar(
                        create_bar_bottom_secondary(
                            widget_config_bottom_secondary),
                        BAR_HEIGHT,
                        border_color=barBorderColor,
                        border_width=barBorderWidth,
                        background=barColor,
                        margin=marginBar,
                        opacity=opacityBar,
                    ),
                ),
            )

        return screenlist
