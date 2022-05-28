echo "Bash version ${BASH_VERSION}..."

COMPLEXITY="d L Lc dLc"
ENCODE="md5 sha1 sha256 sha512"

for complexity in $COMPLEXITY
do
    if [[ $complexity -eq "d" ]]
    then
        charset="0123456789"
    elif [[ $complexity -eq "L" ]]
    then
        charset="abcdghijklmnopqrstuvwxyz"
    elif [[ $complexity -eq "Lc" ]]
    then
        charset="abcdghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    elif [[ $complexity -eq "dLc" ]]
    then
        charset="abcdghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    fi
    
    for encode in $ENCODE
    do
        if [[ $encode -eq "md5" ]]
        then
            type="0"
        elif [[ $encode -eq "sha1" ]]
        then
            type="100"
        elif [[ $encode -eq "sha256" ]]
        then
            type="1400"
        elif [[ $encode -eq "sha512" ]]
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

            while read -r line
            do
                hashcat -a 3 -m 0 ${line} -1 ${charset} ${mask_str} -O -w 3 >> ${output_file} 2>&1
            done < ${input_file}
            
        done
    done
done
