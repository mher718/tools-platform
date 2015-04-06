#!/usr/bin/python3
'''
run background process in "foreground"
location of pid file is required
'''
from os import system, kill
from time import sleep
from os.path import isfile

TIMEOUT = 5
PIDFILE = '/var/run/zabbix/zabbix_server.pid'
CMD = '/usr/sbin/zabbix_server'

system(CMD)
sleep(TIMEOUT)
PID = int(open(PIDFILE, 'r').readlines()[0])

while True:
    try:
        # check if process exists. unfortunately, zombie also responds
        kill(PID, 0)
    except ProcessLookupError:
        exit(127)
    if isfile(PIDFILE):
        sleep(TIMEOUT)
    else:
        exit(255)
