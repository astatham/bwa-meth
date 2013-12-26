. ./common.sh
module load bsmap

cmd="bsmap -u -a $FQ1 -b $FQ2 -d $REF -o results/bsmap-$name.bam -s 12 -v 3 \
             -p 8 -m 0 -x 1000 -S 42 -n 0 -s 12 -I 1"

rm -f logs/bsmap-$name.err logs/bsmap-$name.out
echo $cmd | bsub -J bsmap-$name \
                 -e logs/bsmap-$name.err \
                 -o logs/bsmap-$name.out -n 8


cmd="bsmap -u -a $TRIM_FQ1 -b $TRIM_FQ2 -d $REF -o results/trim/bsmap-$name.bam -s 12 -v 3 \
             -p 8 -m 0 -x 1000 -S 42 -n 0 -s 12 -I 1"

rm -f logs/trim-bsmap-$name.err logs/trim-bsmap-$name.out
echo $cmd | bsub -J trim-bsmap-$name \
                 -e logs/trim-bsmap-$name.err \
                 -o logs/trim-bsmap-$name.out -n 8