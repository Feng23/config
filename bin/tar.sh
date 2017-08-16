#!/bin/sh
set -eu

tar zcvf $1.tar.gz $1\
    --exclude='*.o'\
    --exclude='run'\
    --exclude='tags'\
    --exclude='*.tags'\
    --exclude='.vim.custom'\
    --exclude='.*.swp'
