#!/bin/bash

filename="./projects"

git flow $*
while read project
do
    cd $project
    git flow $*
    cd ..
done < $filename
