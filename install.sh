#!/usr/bin/env bash

for dir in icons themes; do
    rm -rf ~/.$dir
    ln -sf ~/Projects/icons-themes/$dir ~/.$dir
done
