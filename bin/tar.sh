#!/bin/sh
set -eu

tar zcvf $1.tar.gz $1\
    --exclude='.*.swp'
