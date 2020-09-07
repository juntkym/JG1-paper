#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/plot/
#$ -e log/plot/

#$ -pe def_slot 1
#$ -l s_vmem=8G,mem_req=8G
#$ -soft -l sjob,ljob,lljob,lmem,tmem
##$ -soft -l sjob,ljob,lljob,lmem,tmem,ph1_mjob,ph1_lmem

set -eux
trap 'exit 100' ERR
trap 'exit 100' SIGXCPU

date
hostname
pwd


thiscohort="hapmapJPT.jg1abc"

/path/to/R/3.5.1/bin/Rscript plot.R ${thiscohort}


