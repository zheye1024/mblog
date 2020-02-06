#!/bin/bash
APP_NAME=mblog-latest.jar

usage() {
    echo "case: sh run.sh [start|stop|restart|status]"
    exit 1
}

is_exist(){
	pid=`ps -ef|grep $APP_NAME|grep -v grep|awk '{print $2}' `
	if [ -z "${pid}" ]; then
		return 1
	else
		return 0
	fi
}

start(){
	is_exist
	if [ $? -eq "0" ]; then
		echo "${APP_NAME} running. pid=${pid}"
	else
		nohup java -jar $APP_NAME > /logs/mblog/mblog.log 2>&1 &
		echo "${APP_NAME} started"
	fi
}

stop(){
	is_exist
	if [ $? -eq "0" ]; then
		kill -9 $pid
		echo "${pid} stopped"
	else
		echo "${APP_NAME} not running"
	fi
}

status(){
	is_exist
	if [ $? -eq "0" ]; then
		echo "${APP_NAME} running. Pid is ${pid}"
	else
		echo "${APP_NAME} not running"
	fi
}

restart(){
	stop
	start
}

case "$1" in
	"start")
		start
		;;
	"stop")
		stop
		;;
	"status")
		status
		;;
	"restart")
		restart
		;;
	*)
    usage
    ;;
esac
