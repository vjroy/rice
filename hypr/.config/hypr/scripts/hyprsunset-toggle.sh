#!/usr/bin/env bash
# Toggle hyprsunset night light (4500K warm / off)

PIDFILE="/tmp/hyprsunset.pid"

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  kill "$(cat "$PIDFILE")"
  rm "$PIDFILE"
  notify-send "Night Light" "Disabled" -i display-brightness -t 2000
else
  hyprsunset -t 4500 &
  echo $! > "$PIDFILE"
  notify-send "Night Light" "Enabled (4500K)" -i display-brightness -t 2000
fi
