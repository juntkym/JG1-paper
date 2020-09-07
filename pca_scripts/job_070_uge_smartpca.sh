#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/smartpca/
#$ -e log/smartpca/

#$ -pe def_slot 1
#$ -l s_vmem=8G,mem_req=8G
#$ -soft -l sjob,ljob,lljob,lmem,tmem

set -eux
trap 'exit 100' ERR
trap 'exit 100' SIGXCPU

date
hostname
pwd

source config.txt

thiscohort="hapmapJPT.jg1abc"
name=${thiscohort}.pruning.in.shortid

/path/to/EIG/4.2/bin/convertf \
    -p par.PED.EIGENSTRAT.pruning.in

perl /path/to/EIG/4.2/bin/smartpca.perl \
    -i ${name}.eigenstratgeno \
    -a ${name}.snp \
    -b ${name}.ind \
    -k 3 \
    -m 0 \
    -o ${name}.pca \
    -p ${name}.plot \
    -e ${name}.eval \
    -l ${name}.log \
