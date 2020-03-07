#!/bin/bash
#
# Copyright © 2020 ExinPool <robin@exin.one>
#
# Distributed under terms of the MIT license.
#
# Desc: PRESSone blocks monitor script.
# User: Robin@ExinPool
# Date: 2020-03-07
# Time: 15:58:27

LOG_FILE="prs_blocks.log"
SERVICE="PRESSone"
WEBHOOK_URL="https://webhook.exinwork.com/api/send?access_token"
ACCESS_TOKEN=""
REMOTE_NODE="http://51.68.201.144:8888"
LOCAL_NODE="http://127.0.0.1:8888"

REMOTE_BLOCK=`cleos -u ${REMOTE_NODE} get info | grep -w head_block_num | awk -F': ' '{print $2}' | sed "s/,//g"`
LOCAL_BLOCK=`cleos -u ${LOCAL_NODE} get info | grep -w head_block_num | awk -F': ' '{print $2}' | sed "s/,//g"`
ABS=`echo $((${REMOTE_BLOCK}-${LOCAL_BLOCK})) | sed 's/-//'`

if [ ${ABS} -lt 100 ]
then
    LOG="`date '+%Y-%m-%d %H:%M:%S'` `hostname` `whoami` INFO ${SERVICE} node is full sync."
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
else
    LOG="`date '+%Y-%m-%d %H:%M:%S'` `hostname` `whoami` ERROR ${SERVICE} node is not full sync."
    echo $LOG >> $LOG_FILE
fi