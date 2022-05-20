echo "Bash version ${BASH_VERSION}..."

COMPLEXITY="d L Lc dLc"
ENCODE="sha1 sha256 sha512 md5"

for encode in $ENCODE
do
	for complexity in $COMPLEXITY
    do
        mkdir -p ${complexity}
        for length in {4..19}
        do
            timeout --kill-after=1s 1 python3  pydictor/pydictor.py --base "${complexity}" --len ${length} ${length} --encode ${encode} --output ${complexity}/${encode}_${length}.txt
        done
    done
done
