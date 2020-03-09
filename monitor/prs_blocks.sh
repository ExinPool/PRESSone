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

# load the config library functions
source config.shlib

# load configuration
service="$(config_get SERVICE)"
remote_node="$(config_get REMOTE_NODE)"
local_node="$(config_get LOCAL_NODE)"
log_file="$(config_get LOG_FILE)"
webhook_url="$(config_get WEBHOOK_URL)"
access_token="$(config_get ACCESS_TOKEN)"

remote_block=`cleos -u ${remote_node} get info | grep -w head_block_num | awk -F': ' '{print $2}' | sed "s/,//g"`
local_block=`cleos -u ${local_node} get info | grep -w head_block_num | awk -F': ' '{print $2}' | sed "s/,//g"`
blocks_abs=`echo $((${remote_block}-${local_block})) | sed 's/-//'`

if [ ${blocks_abs} -lt 100 ]
then
    log="`date '+%Y-%m-%d %H:%M:%S'` UTC `hostname` `whoami` INFO ${service} node is full sync."
    echo $log >> $log_file
else
    log="`date '+%Y-%m-%d %H:%M:%S'` UTC `hostname` `whoami` ERROR ${service} node is not full sync."
    echo $log >> $log_file
    curl ${webhook_url}=${access_token} -XPOST -H 'Content-Type: application/json' -d '{"category":"PLAIN_TEXT","data":"'"$log"'"}' > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        log="`date '+%Y-%m-%d %H:%M:%S'` UTC `hostname` `whoami` INFO send mixin successfully."
        echo $log >> $log_file
    else
        log="`date '+%Y-%m-%d %H:%M:%S'` UTC `hostname` `whoami` INFO send mixin failed."
        echo $log >> $log_file
    fi
fi