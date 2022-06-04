#!/bin/bash
echo "Bash version ${BASH_VERSION}..."

COMPLEXITY="L Lc dLc dLcs"
ENCODE="md5 sha1 sha256 sha512"

for complexity in $COMPLEXITY
do
    if [[ $complexity == "d" ]]
    then
        charset="0123456789"
    elif [[ $complexity == "L" ]]
    then
        charset="abcdefghijklmnopqrstuvwxyz"
    elif [[ $complexity == "Lc" ]]
    then
        charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    elif [[ $complexity == "dLc" ]]
    then
        charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    elif [[ $complexity == "dLcs" ]]
    then
        charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\!@#\$%^&*()_+.,-=[]{}|\\;':<>/~\"\`"
    fi
    
    for encode in $ENCODE
    do
        if [[ $encode == "md5" ]]
        then
            type="0"
        elif [[ $encode == "sha1" ]]
        then
            type="100"
        elif [[ $encode == "sha256" ]]
        then
            type="1400"
        elif [[ $encode == "sha512" ]]
        then
            type="1700"
        fi

        for length in {4..19}
        do
            input_file="./${complexity}/selected_${encode}_${length}.txt"
            output_file="./${complexity}/selected_${encode}_${length}_out.txt"
            echo ${length}
            mask_str=""
            
            for (( c=1; c<=${length}; c++ ))
            do
                mask_str+="?1"
            done
            echo ${mask_str}

            file=$(cat $input_file)

            for line in $file
            do
                hashcat -a 3 -m ${type} ${line} -1 ${charset} ${mask_str} -O -w 4 >> ${output_file} 2>&1
            done
        done
    done
done
