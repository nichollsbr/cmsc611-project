#!/bin/bash
CURR_DIR=$(pwd)

for file in *.tar; do
	filename="${file%.*}"
	mkdir $filename
	tar -xzf $file -C $filename > /dev/null

	for gzipfile in $filename/*; do
		gzip -fd $gzipfile
		opname="${gzipfile%.gz}"
		sed -i '' '1d' $opname
		gzip $opname
	done
	
	tar -cvf $file $filename
done

