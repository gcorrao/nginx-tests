#!/bin/bash
for image in $(ls); do
  [[ -d $image ]] && echo -e "\n-----------------\nbuilding ${image}..." && cd $image && docker build -t $image . && cd ..
done
