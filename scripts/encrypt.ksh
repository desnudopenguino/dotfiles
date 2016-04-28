#!/bin/ksh

function enc {
echo "Encripting $1 to $2 ..."
	openssl aes-256-cbc -salt -a -e -in $1 -out $2
}
export enc


function dec {
echo "Decripting $1 to $2 ..."
	openssl aes-256-cbc -salt -a -d -in $1 -out $2
}
export dec
