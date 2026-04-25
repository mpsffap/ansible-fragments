import os

###############################################################################
# Global options
###############################################################################
auto_fullscreen = False
focus_on_window_activation = "smart"
cursor_wrap = True
reconfigure_screens = True
auto_minimize = True
wmname = "Qtile"
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = True

###############################################################################
# mod keys
###############################################################################
alt = "mod1"
mod = "mod4"
a = [alt]
m = [mod]
modctrl = [mod, "control"]
modshift = [mod, "shift"]
mcs = [mod, "control", "shift"]
###############################################################################
# Variables and default commandlines
###############################################################################
home = os.path.expanduser("~")
terminal = "kitty"
ap = "spotify --disable-gpu"
ev = "evince"
bb = "LIBVA_DRIVER_NAME=iHD  brave-browser --ignore-gpu-blocklist --enable-gpu-raization --enable-zero-copy --enable-features=VaapiVideoDecoder,CanvasOopRasterization,OverlayScrollbar,UseSkiaRenderer --disable-features=UseChromeOSDirectVideoDecoder --use-gl=desktop --use-angle=d3d11"
ff = "firefox-esr"
fm = "thunar"
ge = "gedit"
gi = "gimp"
gp = f"{home}/.local/bin/launch_gparted.bash"
lu = "lutris"
nv = f"{terminal} nvim"
pc = "pavucontrol"
st = "steam"
tb = "thunderbird"
tm = f"{home}/.local/bin/launch_kitty.bash"
mux = f"{terminal} {home}/.local/bin/launch_tmux.bash"
slh = f"{terminal} {home}/.screenlayout/layout_hive.bash"
xset = "xset r rate 250 50"

rofiwindows = "rofi -show window"
rofilaunch = f"{home}/.local/bin/rofi-boot-launcher.bash"
rofipower = f"{home}/.local/bin/rofi-boot-powermenu.bash"
rofiautorandr = f"{home}/.local/bin/rofi-boot-autorandr.bash"
screenshot = "gnome-screenshot -i"
keepasslauncher = f"keepass2 {home}/mps/secrets/Database.kdbx"
randomwp = f"{home}/.local/bin/randomize_wp.bash"
startup = f"{home}/.local/bin/qtile-autostart-start.bash"
cleanup = f"{home}/.local/bin/qtile-autostart-stop.bash"
update = f"{home}/.local/bin/launch_updates.bash"

spotifynext = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
spotifyprev = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
spotifyplay = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
spotifystop = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop"

wallpapers = {
    "1": "/usr/share/images/wallpaper/wormhole.jpg",
    "2": "/usr/share/images/wallpaper/moon.jpg",
    "3": "/usr/share/images/wallpaper/mountains.jpg",
    "4": "/usr/share/images/wallpaper/zwielicht.jpg",
    "5": "/usr/share/images/wallpaper/mainframe.jpg",
    "6": "/usr/share/images/wallpaper/backyard.jpg",
    "7": "/usr/share/images/wallpaper/mobile.jpg",
    "8": "/usr/share/images/wallpaper/tarkov.jpg",
    "9": "/usr/share/images/wallpaper/guitar.jpg",
    "0": "/usr/share/images/wallpaper/vorschlag.jpg",
}

# bar settings
opacityBar = 1
barBorderWidth = 2
resizeAmount = 30
marginBar = [1, 4, 1, 4]
widthBorder = 1
gapsWindow = 3
widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=14,
    padding=7,
)
extension_defaults = widget_defaults.copy()
