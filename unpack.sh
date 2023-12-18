#!/bin/bash


if [ ! -n "$KEY_LOOP" ]; then
    echo "export KEY_LOOP=xxxxx"	
    exit 1
fi

echo "Iteration $KEY_LOOP"

if [ ! -f "all.tar.bin" ]; then

   echo "File does not exist all.tar.bin"	 
   exit 1
fi


echo "Iteration $KEY_LOOP"


openssl enc -aes-256-ctr -d -pbkdf2 -iter $KEY_LOOP -md sha256 -salt -in all.tar.bin -out all.tar

if [ $? -eq 0 ]; then

   if [ -d all ]; then
        mv all OLD_all
   fi 
     
   tar -xvf all.tar

else 

echo "Decryption error"

fi




if [ -f "all.tar" ]; then
  rm all.tar
fi

	
