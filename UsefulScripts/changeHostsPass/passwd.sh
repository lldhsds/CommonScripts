#!/bin/bash
# 主脚本，批量修改机器密码，需要机器安装tcl和expect。

# 从ip.txt中过滤出ip和密码作为参数传递给expect
for ip in `awk '{print $1}' ./ip.txt`
do 
  pass=`grep $ip ./ip.txt | awk '{print $2}'`
  expect ./action.exp $ip $pass
done
