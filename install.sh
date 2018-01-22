#/usr/bin/env bash

find . -type f -not -iwholename '*git*' -not -iwholename './install.sh' > filelist
sed -i 's|^\.||' filelist
sed -i 's|/install.sh||' filelist

echo /.gitconfig >> filelist
echo /.config/nvim >> filelist

while read file          
do
   path=$(dirname $HOME$file)
   echo $path
   if [ ! -d "$path" ]; then
	mkdir -p $path
   fi
  ln -sf $(pwd)$file $HOME$file
done < filelist

rm filelist
rm ~/filelist
