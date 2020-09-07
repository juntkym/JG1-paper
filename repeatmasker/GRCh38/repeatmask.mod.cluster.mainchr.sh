#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/repeatmask/
#$ -e log/repeatmask/

#$ -pe def_slot 8
#$ -soft -l sjob,ljob,lljob,lmem,tmem,dockers

#$ -t 1-25:1

PARAMS=(
[1]="chr1.fa"
[2]="chr10.fa"
[3]="chr11.fa"
[4]="chr12.fa"
[5]="chr13.fa"
[6]="chr14.fa"
[7]="chr15.fa"
[8]="chr16.fa"
[9]="chr17.fa"
[10]="chr18.fa"
[11]="chr19.fa"
[12]="chr2.fa"
[13]="chr20.fa"
[14]="chr21.fa"
[15]="chr22.fa"
[16]="chr3.fa"
[17]="chr4.fa"
[18]="chr5.fa"
[19]="chr6.fa"
[20]="chr7.fa"
[21]="chr8.fa"
[22]="chr9.fa"
[23]="chrM.fa"
[24]="chrX.fa"
[25]="chrY.fa"
)

mkdir -p output

set -eu
trap 'exit 100' ERR
trap 'exit 100' SIGXCPU

/path/to/bin/RepeatMasker4.0.7/RepeatMasker \
    -species human \
    -dir ./output \
    ./components/${PARAMS[${SGE_TASK_ID}]}