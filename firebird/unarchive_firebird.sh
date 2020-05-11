#!/usr/bin/env bash
#
# This script extracts database file from Firebird archive (.pka 
# or .pka, .p01, .p02, ...), using zip, unzip utilities.
# The input parameter is the directory where the database archive is located.
#

function help {
    echo "Usage: $(basename $0) <data-dir>"
    exit 1
}


data_dir=${1}
[ -z "${data_dir}" ] && help


for file in "$data_dir"/*.p[0-9]*
do
    if [[ -f $file ]] ; then
        newfile=$(echo $file | sed -e 's/\.p\([0-9]*\)$/.z\1/')
        mv -v "$file" "$newfile"
    fi
done


for file in "$data_dir"/*.pka
do
    if [[ -f $file ]] ; then
        mv -v -- "$file" "${file%.pka}.zip"
    fi
done


is_splitted_archive=false
for file in "$data_dir"/*.z[0-9]*
do
    if [[ -f $file ]] ; then
        is_splitted_archive=true
        break
    fi
done

for file in "$data_dir"/*.zip
do
    if [[ ! -f $file ]] ; then
        continue
    fi
    archive_file_name=$(basename "$file")
    if [ "$is_splitted_archive" = true ] ; then
        archive_file_name=$(basename "${file%.zip}_full.zip")
        zip -FF "$file" --out "$data_dir/$archive_file_name"
    fi
    zip -T "$data_dir/$archive_file_name"
    unzip "$data_dir/$archive_file_name" -d "$data_dir"
    break
done


exit 0
