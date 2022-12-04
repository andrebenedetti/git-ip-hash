#!/bin/bash
set -ex

# edit with repos to clone
repositories=(
    "git@github.com:andrebenedetti/lambda-crypto-price-watcher.git"
    "git@github.com:andrebenedetti/canvas_art.git"
)

dirName=`date +"%Y_%m_%d_%s"`

if [ -d "$dirName" ] 
then
    echo "Directory name $dirName was going to be used, but it already exists. Remove it if you don't need it"
    exit 
fi

mkdir $dirName  
pushd $dirName

for VARIABLE in "${repositories[@]}"
do
    git clone $VARIABLE
done

zipName="src-code.zip"
zip -q -r $zipName $(ls)

popd

mv "$dirName/$zipName" .
sha512sum $zipName
