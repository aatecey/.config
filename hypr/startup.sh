#!/bin/bash

# Function to start an app on a specific workspace
start_on_workspace() {
    workspace=$1
    shift
    hyprctl dispatch workspace $workspace
    sleep 0.5
    hyprctl dispatch exec "$@"
    sleep 1
}

start_terminal_with_nvim() {
    workspace=$1
    directory=$2
    hyprctl dispatch workspace $workspace
    sleep 0.5
    hyprctl dispatch exec "kitty --directory=$directory nvim ."
    sleep 1
}

start_terminal_with_aerc() {
    workspace=$1
    hyprctl dispatch workspace $workspace
    sleep 0.5
    hyprctl dispatch exec "kitty aerc"
    sleep 1
}

start_chrome_with_url() {
    workspace=$1
    url=$2
    hyprctl dispatch workspace $workspace
    sleep 0.5
    hyprctl dispatch exec "google-chrome-stable --new-window '$url'"
    sleep 1
}

start_chrome_restore_session() {
    workspace=$1
    hyprctl dispatch workspace $workspace
    sleep 0.5
    hyprctl dispatch exec "google-chrome-stable --hide-crash-restore-bubble --restore-last-session"
    sleep 1
}

# Start applications on specific workspaces
start_on_workspace 1 kitty
start_chrome_restore_session 2
start_terminal_with_nvim 3 ~/sensoteq/sensoteq
start_terminal_with_aerc 4 
start_on_workspace 9 webcord
start_chrome_with_url 9 "https://teams.microsoft.com/"
start_on_workspace 10 spotify

# Switch back to workspace 1
hyprctl dispatch workspace 1
