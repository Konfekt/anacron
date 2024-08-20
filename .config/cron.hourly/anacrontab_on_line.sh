#!/bin/sh

# Do not run jobs when off line
# if command -v nm-online >/dev/null 2>&1; then
#     nm-online --timeout=10 --quiet >/dev/null 2>&1
#     if test "$?" -eq 1; then
#         exit 0
#     fi
# fi
nc -zw3 github.com 22 || exit 0

mkdir --parents "$XDG_DATA_HOME/anacron"
/usr/sbin/anacron -S "$XDG_DATA_HOME/anacron" -t "$XDG_CONFIG_HOME/anacrontab/on_line" -s

