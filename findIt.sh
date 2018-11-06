#!/usr/bin/env  bash
RED='\033[0;31m'
Border(){
        for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#\e[0m" ; done ; echo    
         }

choice() {

echo "Enter file type extension (.txt, .fastq, ect): "
read this
find . -type f | sed 's/.*\.//' | sort | uniq -c | grep -E --color=auto ${this}

Border

read -p "Enter Y to print out the path to the file type, N to choose a new file type or literally any other button to quit." choice
case "$choice" in
        y|Y ) ;;
        n|N ) ;;
        * )  echo -e "${RED} Ok, findIt will quit now.";;
esac
if 
[[ $choice =~ ^(y|Y) ]] ; then
echo " Name a file to put this in. " 
read filename
find . ${this} | sort | uniq | grep ${this} > $filename
fi
if 
 [[ $choice =~ ^(n|N) ]] ; then
echo " What file type extension do you want? " 
read this
find . -type f | sed 's/.*\.//' | sort | uniq -c | grep ${this}
fi
if 
 [[ $choice =~ ^(*) ]] ; then
Border
echo -e "${RED} Ok, Bye"
exit 0
fi

}


choice
