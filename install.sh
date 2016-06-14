#/usr/bin/env bash

find . -type f -not -iwholename '*git*' -not -iwholename './install.sh' > filelist
sed -i 's|^\.||' filelist
sed -i 's|/install.sh||' filelist

echo /.gitconfig >> filelist
echo /.config/nvim >> filelist

while read file          
do
  ln -sf $(pwd)$file $HOME$file
done < filelist

rm filelist
