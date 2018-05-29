#!/bin/bash

function status {
echo -e "Containers status"
echo -e "======================="
docker ps -a
echo -e "======================="
echo -e "Checking Webserver..."
if [[ `curl -Is http://localhost | head -1 | cut -d ' ' -f2` -eq 200 ]]; then
    echo -e "HTTP is OK"
else
    echo -e "HTTP is Error `curl -Is http://localhost | head -1 | cut -d ' ' -f2`"
fi
}

function start {
echo -e "Starting webservices..."
echo -e "======================="
docker-compose up --build -d
sleep 1
echo -e "======================="
echo -e "Containers status"
echo -e "======================="
docker ps -a
}

function stop {
echo -e "Stopping webservices..."
echo -e "======================="
docker stop $(docker ps -a | grep webserver | awk '{print $1}') 
sleep 1
echo -e "======================="
echo -e "Containers status"
echo -e "======================="
docker ps -a | grep webserver
}

function restart {
echo -e "Restarting webservices..."
echo -e "======================="
docker restart $(docker ps -a | grep webserver | awk '{print $1}')
sleep 1
echo -e "======================="
echo -e "Containers status"
echo -e "======================="
docker ps -a | grep webserver
}

function clear {
echo -e "Clearing webservices..."
echo -e "======================="
docker stop $(docker ps -a | grep webserver | awk '{print $1}') && docker rm $(docker ps -a | grep webserver | awk '{print $1}')
sleep 1
echo -e "======================="
echo -e "Containers status"
echo -e "======================="
docker ps -a | grep webserver
}

function clean_images {
echo -e "Clearing old images..."
echo -e "======================="
docker images -q -a | xargs --no-run-if-empty docker rmi
echo -e "======================="
echo -e "Images list"
docker images ls
}

function help {
echo -e "Commands help:"
echo -e "status - check current docker status"
echo -e "start - start containers from docker-compose"
echo -e "stop - stop all running containers"
echo -e "restart - restart all running containers"
echo -e "clear - stop and remove all containers"
echo -e "clean_images - clear all old docker images"
}


case "$1" in
  start)
  start
  echo
  ;;

  stop)
  stop
  echo
  ;;

  status)
  status
  echo
  ;;

  restart)
  restart
  echo
  ;;

  clear)
  clear
  echo
  ;;

  clean_images)
  clean_images
  echo
  ;;

  help)
  help
  echo
  ;;

  *)
  echo -e "Script for control web containers"
  echo -e "Usage: $0 [start|stop|restart|status|clear|clean_images|help]"
  echo
  exit 1
  ;;
esac
