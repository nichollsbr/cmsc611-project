#!/bin/bash

#You should be in the data directory
unzip gsod_csv.zip -d gsod-all
mkdir test-gsod
tar -xzvf gsod-all/gsod_2018.tar --strip=1 -C test-gsod

#IGNORE AFTER THIS - HERE FOR HISTORICAL PURPOSES
# Only following commands in lines not beginning with #
#mkdir noaa
#unzip noaa-global-surface-summary-of-the-day.zip -d noaa/
#cd noaa
#mkdir gsod-all

#change permissions of files in this directory
#chmod 777 * (BE CAREFUL WHERE YOU RUN THIS)

#unzip gsod_all_years.zip gsod_1932.tar -d gsod-all

#unzip gsod_clean.zip
#mkdir test-gsod
#tar -xzvf gsod-all/gsod_2018.tar --strip=1 -C test-gsod

#cd gsod-all

#Don't run the below. Old Notes.
#find . -name "*.tar" -exec awk '{split($0,a,"."); print a[1],a[2],a[3]}' \;

#mkdir gsod_2018
#tar -xzvf gsod_2018.tar -C gsod_2018