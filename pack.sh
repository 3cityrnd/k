#!/bin/bash

if [ ! -n "$KEY_LOOP" ]; then
    echo "export KEY_LOOP=xxxxx"	
    exit 1
fi

echo "Iteration $KEY_LOOP"

if [ ! -d "all" ]; then

   echo "Directory all does not exist unpack first"	 
   exit 1
fi


tar -cvf all.tar all


openssl enc -aes-256-ctr -pbkdf2 -iter $KEY_LOOP -md sha256 -salt -in all.tar -out all.tar.bin


if [ -f "all.tar" ]; then
    rm all.tar
fi


