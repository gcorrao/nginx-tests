#!/bin/bash
for image in $(ls); do
  [[ -d $image ]] && echo "building ${image}..." && cd $image && docker build -t $image . && cd ..
done
