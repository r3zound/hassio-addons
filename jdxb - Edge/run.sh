#!/bin/sh
cd /owjdxb/bin/
while true; do
    echo "hello world"
    sleep 5
done

exec ./owjdxb -s --store=/data/store
