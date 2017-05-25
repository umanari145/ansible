#!/bin/sh

log_file=/var/log/mysqld.log
tmp_pass=(`grep 'password is generated' $log_file | awk -F'root@localhost: ' '{print $2}' `)
echo $tmp_pass
