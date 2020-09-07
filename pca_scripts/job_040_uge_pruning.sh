#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/prune/
#$ -e log/prune/

#$ -hold_jid job_030_uge_merge-samples-across-common-snps.sh

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

ram=7000
thiscohort="hapmapJPT.jg1abc"

# pruning
plink --bfile   ${thiscohort} \
      --memory  ${ram} \
      --indep-pairwise 1500 150 0.03 \
      --out     ${thiscohort}.pruning

plink --make-bed \
      --bfile   ${thiscohort} \
      --memory  ${ram} \
      --extract ${thiscohort}.pruning.prune.in \
      --out     ${thiscohort}.pruning.in
