#!/bin/sh

mkdir --parents "$XDG_DATA_HOME/anacron"
/usr/sbin/anacron -S "$XDG_DATA_HOME/anacron" -t "$XDG_CONFIG_HOME/anacrontab/on" -s

