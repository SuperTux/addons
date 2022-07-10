#!/bin/bash
while getopts f:c: flag
do
    case "${flag}" in
        f) file_name=${OPTARG};;
        c) commit_hash=${OPTARG};;
        *) echo "usage: $0 [-f] [-c]" >&2
           exit 1 ;;
    esac
done

#Detect if parameters are missing or empty.
[[ -z "$file_name" ]] && { echo "No addon filename given." ; exit 1; }
[[ ${file_name:(-4)} != ".zip" ]] && { echo "Given addon filename is invalid." ; exit 1; }
[[ -z "$commit_hash" ]] && { echo "No commit hash given." ; exit 1; }

echo "Filename: $file_name";
echo "Commit hash: $commit_hash";

FILE=index-0_7.nfo #The latest index file where changes should be written to. Change if needed!

echo "" #Empty line
echo "Fetching addon data:"

addon_data=$(grep -A3 -B8 "$file_name\")" $FILE)
addon_data_lines=$(grep -n -A3 -B8 "$file_name\")" $FILE | cut -f1 -d: | cut -f1 -d-)

#Quit if no data is found for the addon.
[[ -z "$addon_data" ]] && { echo "No data found for this addon." ; exit 1; }

#Print initial addon data.
echo "Addon data successfully found:"
echo "$addon_data"
echo "" #Empty line

#Update version with +1.
addon_version_line=$(echo "$addon_data" | grep -o "\(version [0-9]*\)")
addon_version=$(echo "$addon_version_line" | sed -r 's/^.{8}//')
addon_next_version=$((addon_version + 1))

echo "Version: $addon_version"
echo "Next Version: $addon_next_version"

addon_data=$(echo "$addon_data" | sed -e "s/version [0-9]*/version ${addon_next_version}/g")

echo "Version updated in addon data. Current status:"
echo "$addon_data"
echo "" #Empty line

#Update commit hash in URL.
addon_new_url="https://raw.githubusercontent.com/SuperTux/addons/${commit_hash}/repository"

echo "New URL: $addon_new_url"

addon_data=$(echo "$addon_data" | sed -e "s|\"https://raw.githubusercontent.com/SuperTux/addons/.*/repository|\"${addon_new_url}|g")

echo "URL updated in addon data. Current status:"
echo "$addon_data"
echo "" #Empty line

#Update MD5 checksum.
addon_file=repository/$file_name
addon_file_md5=($(md5sum "$addon_file"))

[[ -z "$addon_file_md5" ]] && { echo "There was an error generating this addon's MD5." ; exit 1; }

echo "Addon file: $addon_file"
echo "Addon file MD5: $addon_file_md5"

addon_data_before_md5=$addon_data
addon_data=$(echo "$addon_data" | sed -e "s/md5 \".*\"/md5 \"${addon_file_md5}\"/g")

#Exit if addon MD5 is equal to previous MD5.
[[ "$addon_data" == "$addon_data_before_md5" ]] && { echo "Addon MD5 is the same as old MD5. Addon file has no changes. Exiting." ; exit 1; }

echo "MD5 updated in addon data. Current status:"
echo "$addon_data"
echo "" #Empty line

#Replace addon entry with updated one.
IFS=$'\n'
addon_data=($addon_data)
addon_data_lines=($addon_data_lines)
addon_data_first_line="${addon_data_lines[0]}"

for line in "${addon_data_lines[@]}"
do
    data="${addon_data[$((line - addon_data_first_line))]}"
    sed -i "${line}s@.*@${data}@g" $FILE
    echo "Updated line ${line} in ${FILE}."
done
