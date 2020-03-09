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

# load the config library functions
source config.shlib

# load configuration
service="$(config_get SERVICE)"
process="$(config_get PROCESS)"
process_num="$(config_get PROCESS_NUM)"
process_num_var=`ps -ef | grep ${process} | grep -v grep | wc -l`
log_file="$(config_get LOG_FILE)"
webhook_url="$(config_get WEBHOOK_URL)"
access_token="$(config_get ACCESS_TOKEN)"

if [ ${process_num} -eq ${process_num_var} ]
then
    log="`date '+%Y-%m-%d %H:%M:%S'` UTC `hostname` `whoami` INFO ${service} node process is normal."
    echo $log >> $log_file
else
    log="`date '+%Y-%m-%d %H:%M:%S'` UTC `hostname` `whoami` ERROR ${service} node process is abnormal."
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