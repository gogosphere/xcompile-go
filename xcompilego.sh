#!/bin/bash
if [ -z "$1" ]; then
echo "You must pass the name of the GO code."
echo "Example: crosscompile.sh code.go"
exit 255
fi

FILE=$(echo ${1%.go})

for i in linux windows darwin
do
 echo "Now building: $FILE-$i"
 env GOPATH=$(pwd) GOOS=$i GOARCH=386 go build -o $FILE-$i $1
done
