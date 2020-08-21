#!/bin/bash

OUT_FOLDER=$1
source /srv/adm/modules/init/sh # load the module system when using zsh

module load python/anaconda-2020.02

changed_files=`git diff --cached --name-only --diff-filter=ACM`

for file in $changed_files
do
    if [ ${file: -6} == ".ipynb" ]
    then
        name=${file%.ipynb}
        jupyter nbconvert $file --output ${OUT_FOLDER}${name}
    fi
done

