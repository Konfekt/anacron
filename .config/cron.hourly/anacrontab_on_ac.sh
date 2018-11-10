#!/bin/sh

# Do not run jobs when on battery power
(command -v on_ac_power >/dev/null 2>&1 && on_ac_power) || exit 0

mkdir --parents "$XDG_DATA_HOME/anacron"
mkdir --parents "$XDG_CACHE_HOME/anacron"
/usr/sbin/anacron -S "$XDG_DATA_HOME/anacron" -t "$XDG_CONFIG_HOME/anacrontab/on_ac" -s

