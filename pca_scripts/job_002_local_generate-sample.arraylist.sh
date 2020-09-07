#!/bin/bash

find | grep .bim$ | awk '{print substr($1,1,length($1)-4)}' | mkarray --name PREFIX | sed '$d' \
    > sample.arraylist

