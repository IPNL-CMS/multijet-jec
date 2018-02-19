#!/bin/bash

# This script downloads JEC tarballs from the official repository, unpacks them, deletes unneeded
# files, and copies remaining ones into the current directory.

set -e


dirSource=`pwd`

blocks=()
version="4"

for era in B C D E F
do
    blocks+=("Fall17_17Nov2017${era}_V${version}_DATA")
done

blocks+=("Fall17_17Nov2017_V4_MC")


# Temporary directory to store intermediate files
dirTemp=`mktemp -d`
cd $dirTemp
echo $dirTemp


# Download and unpack all data
dirUnpacked=unpacked
mkdir $dirUnpacked

for block in ${blocks[*]}
do
    wget https://github.com/cms-jet/JECDatabase/raw/master/tarballs/${block}.tar.gz
    tar -xf ${block}.tar.gz
    
    if [ -d textFiles/${block} ]; then
        mv textFiles/${block}/* $dirUnpacked/
    elif [ -d ${block} ]; then
        mv ${block}/* $dirUnpacked/
    else
        mv ${block}* $dirUnpacked/
    fi
done


# Remove all files that are not needed
cd $dirUnpacked
find . -not -name "*AK4PFchs*" -delete
find . -name "*_DATA_Uncertainty*" -delete
find . -name "*DataMcSF*" -delete
find . -name "*_UncertaintySources_*" -delete

chmod 644 *.txt


# Move remaining files to the original current directory and remove temporary directory
mv *.txt $dirSource
cd $dirSource
rm -r $dirTemp
