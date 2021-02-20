#!/bin/bash
MYDIR_START=`dirname $0`
DIR_START="`cd $MYDIR_START/../; pwd`"

. $DIR_START/telegram_config.sh

if [ "$bot_disable" = "0" ]; then
python3 $DIR_START/scripts/bot.py "$token" "$port" "$DIR_START" &
fi

echo "time_msg=0" > $DIR_START/scripts/time_config.txt
echo "time_pause=0" >> $DIR_START/scripts/time_config.txt

echo "print_state=0" > $DIR_START/scripts/state_config.txt
echo "pause=0" >> $DIR_START/scripts/state_config.txt

python3 $DIR_START/scripts/websocket-connection-telegram.py "$port" "$DIR_START" &
exit 1