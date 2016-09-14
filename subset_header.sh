#!/bin/sh

## This script subsets a file by headers
#  fn --> input file
#  list --> file with list of headers (one on each line)
fn=$1
list=$2

cols=($(sed '1!d;s/\t/\n/g' $fn | grep -w -nf $list | sed 's/:.*$//'))
cut -f 1$(printf ",%s" "${cols[@]}") $fn
