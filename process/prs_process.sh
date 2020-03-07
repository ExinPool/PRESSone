#!/bin/bash
#
# Copyright © 2020 ExinPool <robin@exin.one>
#
# Distributed under terms of the MIT license.
#
# Desc: PRESSone process monitor script.
# User: Robin@ExinPool
# Date: 2020-03-07
# Time: 15:58:27

LOG_FILE="prs_process.log"
PROCESS="nodeos"
PROCESS_NUM=1
SERVICE="PRESSone"
WEBHOOK_URL="https://webhook.exinwork.com/api/send?access_token"
ACCESS_TOKEN=""

process=`ps -ef | grep ${PROCESS} | grep -v grep | wc -l`

if [ $process -eq ${PROCESS_NUM} ]
then
    LOG="`date '+%Y-%m-%d %H:%M:%S'` `hostname` `whoami` INFO ${SERVICE} node process is normal."
    echo $LOG >> $LOG_FILE
else
    LOG="`date '+%Y-%m-%d %H:%M:%S'` `hostname` `whoami` ERROR ${SERVICE} node process is abnormal."
    echo $LOG >> $LOG_FILE
    curl ${WEBHOOK_URL}=${ACCESS_TOKEN} -XPOST -H 'Content-Type: application/json' -d '{"category":"PLAIN_TEXT","data":"'"$LOG"'"}' > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        LOG="`date '+%Y-%m-%d %H:%M:%S'` `hostname` `whoami` INFO send mixin successfully."
        echo $LOG >> $LOG_FILE
    else
        LOG="`date '+%Y-%m-%d %H:%M:%S'` `hostname` `whoami` INFO send mixin failed."
        echo $LOG >> $LOG_FILE
    fi
fi