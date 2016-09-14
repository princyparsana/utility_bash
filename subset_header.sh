
#!/bin/sh

## This script subsets a file by headers
#  fn --> input file
#  list --> file with list of headers (one on each line)
fn=$1
list=$2

cols=($(sed '1!d;s/, /\n/g' $fn | grep -nf $list | sed 's/:.*$//'))
cut -d '\t' -f 1$(printf ",%s" "${cols[@]}") $fn
