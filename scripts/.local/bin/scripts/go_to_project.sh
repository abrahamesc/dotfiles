#!/usr/bin/env bash

selected=$(find ~/projects -mindepth 1 -maxdepth 20 -type d | fzf)

tmux new-session -c $selected -t dev
