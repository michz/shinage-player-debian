#! /bin/bash
#
# run-browser.sh
# Copyright (C) 2016 Michael Zapf <michi.zapf@mztx.de>
#


URL=http://www.mztx.de


sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' ~/.config/chromium/Default/Preferences


chromium --noerrdialogs --incognito --disable-translate \
    --disable-translate-new-ux --disk-cache-size 0 \
    --kiosk $(URL)


