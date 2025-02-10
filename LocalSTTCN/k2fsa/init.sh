#!/bin/bash

if [ ! -f "/module/start.sh" ]; then
    cp /k2fsa/start.sh "/module/start.sh"
fi

/module/start.sh
