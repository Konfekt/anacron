This is a template to schedule jobs (such as a daily automated backup) on `UNIX` based operating systems, such as `Linux`, `Free BSD` and `MacOS`, via the program `anacron` (invoked by the daemon `cron`).
Inside the directories `.config/anacron.daily/`, `.config/anacron.weekly/` and `.config/anacron.monthly/`, it runs once a day, once a week and once a month all executables

- in the folder `on_line` only when the computer is online,
- in the folder `on_ac` only when the computer is on power supply,
- in the folder `on_line_ac` only when both of the above are satisfied, and
- in the folder `on` under any conditions.

See <https://konfekt.github.io/blog/2016/12/11/sane-cron-setup> to see how this is achieved.

# Installation

1. Clone this repository
    ```sh
    git clone https://github.com/konfekt/anacron ~/Downloads/
    ````
0. Copy its folders, that is, `.config` and `bin`, into your home directory `~/`
    ```sh
    cd ~/Downloads/anacron
    cp --recursive ./.config ./bin ~/
    ```
0. Replace `KONFEKT` by your user name `$USER` by
    ```sh
    grep --recursive --files-with-matches '\<KONFEKT\>' . | xargs sed --in-place "s/\<KONFEKT\>/$USER/g"
    ```
0. Enable the jobs
    ```sh
    crontab ~/.config/crontab
    ```

# Suggestions

If you want to schedule a daily backup of selected files

- to the cloud, have a take at <https://github.com/konfekt/backup2cloud.sh>
- to a `USB` drive, have a take at <https://github.com/konfekt/backup2usb.sh>.

# Caveats

Be aware that to run a `GUI` by `(ana)cron`, the environment variable `$DISPLAY` has to be set, for example, `$DISPLAY=:0`.
There are some more caveats listed at <https://askubuntu.com/questions/23009/why-crontab-scripts-are-not-working>, most already put out of the way by using this configuration as a template.

# Credits

The `run-parts.sh` script is taken from <https://github.com/wolfbox/run-parts> (there are alternatives such as that in <https://github.com/cronie-crond/crontabs>), `on_ac_power` from <https://github.com/OpenRC/openrc/tree/master/scripts> and `cronic` is available at [Chuck Houpt's homepage](http://habilis.net/cronic/).
