#!/bin/bash
CURR_DIR=$(pwd)

rm -rf gsod-all
rm -f gsod_csv.zip
mkdir gsod-all
unzip gsod_all_years.zip -d gsod-all > /dev/null
# unzip gsod_all_years.zip gsod_1932.tar gsod_1933.tar -d gsod-all > /dev/null

cd gsod-all

for file in *.tar; do
	filename="${file%.*}"
	echo "------------"
	echo $file #gsod_1932.tar
	echo $filename #gsod_1932

	rm -rf $filename #cleanup any previous reference
	mkdir $filename #prep for next command
	tar -xzf $file -C $filename > /dev/null #untar
	rm -rf $file #remove tar file

	for gzipfile in $filename/*; do
		# echo $gzipfile
		gzip -fd $gzipfile #removes gzipfile
		opname="${gzipfile%.gz}"
		sed -i '' '1d' $opname #remove header
		sed -e 's/[[:space:]]\{1,\}/,/g' $opname > ${opname}.csv #make csv
		rm -f $opname
		# May need to change below script
		gzip ${opname}.csv
	done

	tar -cf $file $filename #> /dev/null
	rm -rf $filename

	echo "FINISHED"
	echo "------------"
done

zip $CURR_DIR/gsod_csv.zip * > /dev/null
