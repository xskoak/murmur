#!/bin/sh

if ! [ -z ${PASSWORD+x} ];
then
    sed -E -i "s/serverpassword=[a-z].+$/serverpassword=$PASSWORD/g" /etc/murmur.ini
fi

if ! [ -z ${PORT+x} ];
then
    sed -E -i "s/port=[0-9].+$/port=$PORT/g" /etc/murmur.ini
fi

if ! [ -z ${BANDWIDTH+x} ];
then
    sed -E -i "s/bandwidth=[0-9].+$/bandwidth=$BANDWIDTH/g" /etc/murmur.ini
fi

sed -E -i "s/uname=murmur/uname=root/g" /etc/murmur.ini

murmurd -ini /etc/murmur.ini -fg
