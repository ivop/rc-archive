#! /bin/bash

rm -f README.md

n=`basename $(pwd)`

for i in *.xex ; do
    j=`basename "$i" .xex`.png

    i=`echo "$i" | sed 's/ /%20/g'`
    j=`echo "$j" | sed 's/ /%20/g'`

    echo '[![]('"$j"')]'"(https://github.com/ivop/rc-archive/raw/master/$n/$i)" >> README.md

done

