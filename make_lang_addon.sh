#!/bin/sh
ignore_directories=( world-1 world-2 bonus-1 bonus-2 bonus-3 menu-principale )
final_destination="https://raw.githubusercontent.com/SuperTux/addons/master/langpacks"

languages=()
outdir=""
RED='\033[0;31m'
NC='\033[0m' # No Color

get_languages() {
	langs=()
	langs=$(find "$1" -name "*.po" -exec basename {} \; | uniq | cut -d'.' -f1)
	languages=($(printf "%s\n" "${langs[@]}" | sort | uniq -c | awk '{ print $2 }'))
}

# Usage: inarray "$value" "${array[@]}" 
inarray() { local n=$1 h; shift; for h; do [[ $n = "$h" ]] && return; done; return 1; }

echo "${RED}Gathering available languages...${NC}"

outdir="$1"
langpack_dir="$outdir/langpacks"

get_languages "$outdir"

mkdir -p "$langpack_dir"
REPO_INDEX_FILE="$langpack_dir/index_to_change.nfo"
echo > "$REPO_INDEX_FILE" # Clear file 
echo "; ###### LANGUAGE PACKS BEGIN ######" >> "$REPO_INDEX_FILE" 

for i in ${languages[@]}; do
	echo "${RED}Creating language pack for $i...${NC}"
	# create outer directory:
	mkdir -p "$langpack_dir/langpack-$i"
	
	#create NFO file:
	NFO_FILE="$langpack_dir/langpack-$i/langpack-$i.nfo"
	echo "(supertux-addoninfo\n\
	 (id \"langpack-$i\")\n\
	 (version 1)\n\
	 (type \"languagepack\")\n\
	 (title \"langpack-$i\")\n\
	 (author \"Various\")\n\
	 (license \"GPL 2+ / CC-by-sa 3.0\")\n\
	)" >> "$NFO_FILE"
	
	# create inner directory:
	mkdir -p "$langpack_dir/langpack-$i/langpack-$i"

	# copy language files:
	find "$outdir" -name "$i.po" | while read line; do
		basedir=$(dirname "$line")
		curr_langpack_dir="$langpack_dir/langpack-$i/langpack-$i"
		
		# Get name of parent directory:
		dir_name=$(basename "$basedir")
		
		# Remove supertux.{something} from directory name:
		dir_name=${dir_name/supertux./}
		
		# Check if directory is in ignore list:
		if inarray "${dir_name}" "${ignore_directories[@]}"; then
			continue
		fi

		# Copy relevant files to the langpack directory:
		mkdir -p "$curr_langpack_dir/${dir_name}"
		cp "$basedir/$i.po" "$curr_langpack_dir/${dir_name}" 2> /dev/null
	done
	
	# zip the language files:
	cd "$langpack_dir/langpack-$i"
	zip -9 -q -r "$langpack_dir/langpack-$i.zip" "."
	cd ..
	
	FILE_HASH=$(md5 -q "$langpack_dir/langpack-$i.zip")
	
	# update add-on info script:
	echo "(supertux-addoninfo\n\
    (id \"langpack-$i\")\n\
    (version 1)\n\
    (type \"languagepack\")\n\
    (title \"langpack-$i\")\n\
    (author \"Various\")\n\
    (license \"GPL 2+ / CC-by-sa 3.0\")\n\
    (url \"$final_destination/langpack-$i.zip\")\n\
    (md5 \"$FILE_HASH\")\n\
   )" >> "$REPO_INDEX_FILE"
	
	# remove previously created folder:
	rm -rf "langpack-$i/"
done

echo "; ###### LANGUAGE PACKS END ######" >> "$REPO_INDEX_FILE"
# end