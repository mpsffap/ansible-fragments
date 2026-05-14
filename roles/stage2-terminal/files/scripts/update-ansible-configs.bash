#!/bin/bash

# Target dir
ANSDIR=~/mps/repo/github/mpsffap/ansible-fragments

# Target subdirs
ROLEDIR="$ANSDIR"/roles
# stage2
STAGE2DOT="$ROLEDIR"/stage2-terminal/files/dotfiles
STAGE2ETC="$ROLEDIR"/stage2-terminal/files/etc
STAGE2SKL="$ROLEDIR"/stage2-terminal/files/skeletons
STAGE2CFG="$STAGE2DOT"/.config
# stage4
STAGE4DOT="$ROLEDIR"/stage4-desktop/files/dotfiles
STAGE4CFG="$STAGE4DOT"/.config

# local dirs
LOCCFG="$HOME/.config"
LOCETC="/etc"

# Update Stage2
cp -r "$LOCCFG"/nvim "$STAGE2CFG"/
cp -r "$LOCCFG"/nvim-core "$STAGE2CFG"/
cp -r "$LOCCFG"/nvim-minimal "$STAGE2CFG"/
cp -r "$LOCCFG"/nvim-tools "$STAGE2CFG"/
cp -r "$LOCCFG"/bashrc "$STAGE2CFG"/
cp -r "$LOCETC"/bash_aliases.d/ "$STAGE2ETC"/
cp -r "$LOCCFG"/kitty "$STAGE2CFG"/
cp -r "$LOCCFG"/tmux/tmux.conf "$STAGE2CFG"/tmux
cp -r "$LOCCFG"/tmux/tmux.conf.local "$STAGE2CFG"/tmux
cp -r "$LOCCFG"/skeletons/* "$STAGE2SKL"/

# Update Stage4
cp -r "$LOCCFG"/qtile "$STAGE4CFG"/
cp -r "$LOCCFG"/kanata "$STAGE4CFG"/
cp -r "$LOCCFG"/Thunar "$STAGE4CFG"/
