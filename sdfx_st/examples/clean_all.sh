#!/bin/bash
for i in $(find -maxdepth 1 -mindepth 1 -type d); do
    pushd $i
    rm -rf build
    popd
done

