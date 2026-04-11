#!/bin/bash

export DISPLAY=:0
sh -c "$HOME/.venvs/default/bin/qtile start > /tmp/qtile.log 2>&1"
