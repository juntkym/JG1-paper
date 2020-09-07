#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/shorten/
#$ -e log/shorten/

#$ -hold_jid job_040_uge_pruning.sh

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
updatetable="../info/updateid.table.r3"

# convert long id to short id
plink --make-bed \
      --bfile      ${thiscohort}.pruning.in \
      --update-ids ${updatetable} \
      --memory     ${ram} \
      --out        ${thiscohort}.pruning.in.shortid 

# output as ped, map
plink --recode \
      --bfile  ${thiscohort}.pruning.in.shortid \
      --out    ${thiscohort}.pruning.in.shortid 
