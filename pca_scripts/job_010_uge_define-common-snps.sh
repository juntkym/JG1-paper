#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/define/
#$ -e log/define/

#$ -pe def_slot 1
#$ -l s_vmem=4G,mem_req=4G
#$ -soft -l ljob,lljob,lmem,tmem,ph1_mjob,ph1_lmem

set -eux
trap 'exit 100' ERR
trap 'exit 100' SIGXCPU

date
hostname
pwd

#basecohort="hapmap3_r2_b36_all"

find | grep bim$ \
    | xargs cat \
    | cut -f 2 \
    | sort \
    | uniq -c \
    | awk '$1==4 {print $2}' \
    > common_snps.txt

wc -l common_snps.txt
