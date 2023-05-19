#!/bin/zsh
if [ ! -f $1 ]; then
  echo "file \"$1\" not found"
  exit
fi
filenameSuffix=".xml.zip"
integer len_filenameSuffix=`echo $filenameSuffix | wc -c`
spaceKey=`unzip -p Confluence-space-export-073907-2.xml.zip exportDescriptor.properties | grep "^spaceKey=" | awk -F '=' '{print $2}'`
integer pos1=$((`echo $1 | wc -c` - $len_filenameSuffix))
printf -v newFileName "%s.%s%s" `echo $1 | cut -c 1-${pos1}` $spaceKey $filenameSuffix
mv $1 $newFileName
