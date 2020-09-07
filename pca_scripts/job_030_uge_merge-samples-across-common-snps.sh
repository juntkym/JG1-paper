#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/merge/
#$ -e log/merge/

#$ -hold_jid job_020_uge_extract-common-snps.sh

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

basecohort="hapmap3_r2_b36_all.filter.JPT"
ram=7000

thiscohort="hapmapJPT.jg1abc"

find | grep bi-allelic.common.bim$ \
  | sed -e 's/.bim//g' \
  > merge_files.fofn

# merge sample files
plink --make-bed \
      --memory  ${ram} \
      --allow-extra-chr \
      --bfile   ${basecohort}/${basecohort}.common \
      --merge-list merge_files.fofn \
      --out     ${thiscohort}
