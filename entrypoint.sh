#!/bin/sh


if [ ! "$(ls -A /etc/asterisk )" ]
then
    cp -rf /var/tmp/asterisk/ /etc/
asterisk -vvf