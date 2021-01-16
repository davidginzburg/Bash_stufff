#! /bin/bash

# Function
get_File(){

	local str="$1"  #string to search	
	local fil="$2"  #filename


	# echo "the string you are Looking for is: $str "
	# echo " the file is you are searching is  $fil  "

	#grep -ni $str $fil

	check=$(grep -ni "$str" "$fil") #searching for the how_word with the line number

	if [ -z "$check" ]; then
		echo "### Empty! ###"
	else
		echo "FOUND!"
		local name_file=$(basename "$fil") ##keeping just the name of the file, and not the hole path..
		#echo "just the name is: $name_file"

		cp "$fil" hot-Folder/"$name_file"
		echo " " >> hot-Folder/"$name_file"   #
		echo "*-------##****" >> hot-Folder/"$name_file"
		echo "$check" >> hot-Folder/"$name_file"
	fi
}


###################### Whole Program ###################
read -p  "what_hot_word_to_search: " hot_word  #checking if the input is valid and its not empty string...
if [ -z "$hot_word" ]; then
	while [ $hot_word !="" ];
	do
		read -p  "what_hot_word_to_search: " hot_word
	done
fi
rm -r /hot-folder
mkdir ./hot-Folder
for i in $(find . -type d); #searching the files from where we put the script and above those folders lvls
do

if [ "$i" != "./hot-folder" ]; then
	echo "************* THE FOLDER IS $i ***********"
	for myfile in $i/*;
	do 													
		if [ -f "$myfile" ] ; then				#  			
			get_File "$hot_word" "$myfile"			# Function
		fi 										#		
	done
fi	
	echo "--------------"
done
###################### Whole Program ###################







