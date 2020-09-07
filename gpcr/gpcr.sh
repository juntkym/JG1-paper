#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log
#$ -e log

#$ -t 1-12:1

PARAMS=(
[1]="GeneMap99-G3"
[2]="GeneMap99-GB4"
[3]="Genethon"
[4]="Marshfield"
[5]="NCBI_RH"
[6]="NHGRI-7"
[7]="Stanford-G3"
[8]="TNG"
[9]="WUSTL-X"
[10]="Whitehead-RH"
[11]="Whitehead-YAC"
[12]="deCODE"
)

gPCR2 \
    ./primer_for_gPCR2/${PARAMS[${SGE_TASK_ID}]}.uniq.sts.name.primer_column4.table \
    -Ajg1c.jg1a-jg1b-arrow.draft.norm.cns\
    -S\
    -D\
    > jg1c.jg1a-jg1b-arrow.draft.norm.cns.${PARAMS[${SGE_TASK_ID}]}.gPCR.results
