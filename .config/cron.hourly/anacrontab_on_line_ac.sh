#!/bin/sh

# Do not run jobs when on battery power
(command -v on_ac_power >/dev/null 2>&1 && on_ac_power) || exit 0

# Do not run jobs when off line
nc -zw3 github.com 22 || exit 0
# if command -v nm-online >/dev/null 2>&1; then
#     nm-online --timeout=10 --quiet >/dev/null 2>&1
#     if test "$?" -eq 1; then
#         exit 0
#     fi
# fi

mkdir --parents "$XDG_DATA_HOME/anacron"
/usr/sbin/anacron -S "$XDG_DATA_HOME/anacron" -t "$XDG_CONFIG_HOME/anacrontab/on_line_ac" -s

