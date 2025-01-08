#!/bin/sh

inspath=$(dirname $0)
cd ${inspath}
binpath="$(pwd)/bin/owjdxb"

_stop() {
    chmod +x ${binpath}
    ${binpath} --kill=yes
}

_stop
_stop
exit 0
