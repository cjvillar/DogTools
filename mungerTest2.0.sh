#!/usr/bin/env bash
#Chris Villarreal 
#################################################################################
# munge.sh
#################################################################################
# Purpose
# This "Munges" the new file paths to suitable maniFest for the specific Lab directory 
#################################################################################
# Run program with no arguments for expanded usage. 
#
#       $ munge.sh file.txt 
#
#################################################################################
# If no file is found, display help                                             #
#################################################################################
 if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
                clear
                echo "Please use a .txt file containing the data you'd like to munge."
        exit 0

        else
##################################################################################
# Functions make this easier 						       	#	
##################################################################################
        	Border(){
 	for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#\e[0m" ; done ; echo	
         }

	PREV(){
	 head $FILE 
   	}
	
	DELIM(){
	echo "Enter the delimiter would you like to use: "
	Border
	read delim	
	cat $FILE | while read line; do grep -E --color=auto ${delim} ; done
	Border
	echo " Press Enter to cut at ${delim} ?"
	Border
	read -n 1 -s 
	clear 
	}

	FIELD(){
	Border
        echo "Choose a field" 
	Border
        read fil
        cat $FILE | tr -s ${delim} | cut -d ${delim} -f ${fil}
        Border
	}
	
	CHOICE(){
        read -p "Enter Y to add to a File, N to choose a new field or literally any other button to quit." choice
        Border
	case "$choice" in
		y|Y ) ;;
		n|N ) ;;
		* )  echo -e "${RED} Ok, Munger will quit now.";;
	esac
	if 
	[[ $choice =~ ^(y|Y) ]] ; then
	echo " What do you want to name the file: " 
	read fileName1
        cat $FILE | tr -s ${delim} | cut -d ${delim} -f ${fil} > $fileName1
        echo "Your file $fileName1 has been made"
        CHOICE
	fi
	if 
 	 [[ $choice =~ ^(n|N) ]] ; then
	Border
	FIELD
	CHOICE
	fi
	 if 
         [[ $choice =~ ^(*) ]] ; then
        Border
	echo -e "${RED} Ok, Munger will quit now."
  	 exit 0 
	fi
	}

                #########################################################################
                # Otherwise, a file was set.                                            #
                #########################################################################       
                FILE=$1
                        INPUT=$(cat $FILE)
                        INPUTTEXT="cat $FILE"
                        LINECOUNT=$(cat $FILE | wc -l)
			RED='\033[0;31m'
			BLUE='\e[34m'
			NC='\033[0m' # No Color
        fi

	 cat << 'EOF'


	`-:-.   ,-;"`-:-.   ,-;"`-:-.   ,-;"`-:-.   ,-;"
   	   `=`,'=/     `=`,'=/     `=`,'=/     `=`,'=/
     	     y==/        y==/        y==/        y==/
   	   ,=,-<=`.    ,=,-<=`.    ,=,-<=`.    ,=,-<=`.
	,-'-'   `-=_,-'-'   `-=_,-'-'   `-=_,-'-'   `-=_


EOF


		


		Border
		echo -e "The file ${RED}$FILE${NC} has ${RED}$LINECOUNT${NC} Lines"
		Border
		echo "If this looks correct press Enter to continue"
		Border
		read -n 1 -s

  ##################################
  # New Workflow developing 	   #	
  ##################################
	Border
	DELIM
	FIELD
	Border
        read -p "Enter Y to add to a File, N to choose a new field or literally any other button to quit." choice
        Border
	case "$choice" in
		y|Y ) ;;
		n|N ) ;;
		* )  echo -e "${RED} Ok, Munger will quit now." ;;
	esac
	if 
	[[ $choice =~ ^(y|Y) ]] ; then
	Border
	echo " What do you want to name the file: " 
	read fileName1
	cat $FILE | tr -s ${delim} | cut -d ${delim} -f ${fil} > $fileName1
	echo "Your file $fileName1 has been made"
	CHOICE
	fi
	if 
 	 [[ $choice =~ ^(n|N) ]] ; then
	Border
	FIELD
	Border
	CHOICE
	Border
	fi
	 if 
         [[ $choice =~ ^(*) ]] ; then
        Border
	echo -e "${RED} Ok, Munger will quit now."
  	 exit 0 
	fi

	
