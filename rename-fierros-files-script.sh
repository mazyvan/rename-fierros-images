#!/bin/bash
# Fierros Rename Files - Bash script, by Iván Sánchez

set -e
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

echo 'Fierros Rename Files - Bash script, by Iván Sánchez'
echo ""
echo "[Warning]: Do not perform any operations on the directory while this script is running"
read -n1 -r -p "Press any key to continue... " key
echo ""

images_path="./images"

for dir in $images_path/*/; do

  dirname=$(basename "$dir")
  echo '- Moving to folder "'$dir'"'

  # Trying to get files inside "Fierro" folder
  fierro_folder=`ls "${dir}Fierro"`
  for file in $fierro_folder; do
    file_extension="${file##*.}"
    # Renaming the 'fierro' image
    old_file="${dir}Fierro/$file"
    new_file="${dir}Fierro/${dirname}.${file_extension}"
    if [ "${old_file}" != "${new_file}" ]
    then
      mv "$old_file" "$new_file"
      echo '  - File "'$old_file'" successfully renamed to "'$new_file'"'
    fi
  done

  # Trying to get files inside "Foto" folder
  foto_folder=`ls "${dir}Foto"`
  for file in $foto_folder; do
    file_extension="${file##*.}"
    # Renaming the 'foto' image
    old_file="${dir}Foto/${file}"
    new_file="${dir}Foto/${dirname}.${file_extension}"
    if [ "${old_file}" != "${new_file}" ]
    then
      mv "${old_file}" "${new_file}"
      echo '  - File "'$old_file'" successfully renamed to "'$new_file'"'
    fi
  done

done

IFS=$SAVEIFS

echo ""
echo "Every file in the path has been successfully renamed"
