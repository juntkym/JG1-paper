#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/extract-common-snp/
#$ -e log/extract-common-snp/

#$ -t 1-4:1

#$ -hold_jid job_010_uge_define-common-snps.sh

#$ -pe def_slot 1
#$ -l s_vmem=8G,mem_req=8G
#$ -soft -l sjob,ljob,lljob,lmem,tmem,ph1_mjob,ph1_lmem

set -eux
trap 'exit 100' ERR
trap 'exit 100' SIGXCPU

date
hostname
pwd

source config.txt

source sample.arraylist
prefix=${PREFIX[${SGE_TASK_ID}]}

#basecohort="hapmap3_r2_b36_all"
ram=7000

plink --make-bed \
      --memory   ${ram} \
      --allow-extra-chr \
      --bfile    ${prefix} \
      --extract  common_snps.txt \
      --out      ${prefix}.common 
