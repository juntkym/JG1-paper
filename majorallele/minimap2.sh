#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -o ./log/out/
#$ -e ./log/err/

#$ -pe def_slot 12
#$ -l s_vmem=8G,mem_req=8G

#$ -t 1-3:1

QRY=(
[1]="jg1a"
[2]="jg1b"
[3]="jg1c"
)

ref=jg1a.jg1b-jg1c
# ref=jg1a.jg1c-jg1b
# ref=jg1a-jg1b.jg1c
# ref=jg1a-jg1c.jg1b
# ref=jg1b.jg1a-jg1c
# ref=jg1b.jg1c-jg1a
# ref=jg1b-jg1a.jg1c
# ref=jg1b-jg1c.jg1a
# ref=jg1c.jg1a-jg1b
# ref=jg1c.jg1b-jg1a
# ref=jg1c-jg1a.jg1b
# ref=jg1c-jg1b.jg1a

minimap2 \
    -t 12 \
    -cx asm5 \
    --cs=long \
    ./data/triple_merged_genome/${ref}-arrow.draft.fa \
    ./data/single_genome/${QRY[${SGE_TASK_ID}]}-arrow.draft.fa \
    > ./paf/R${ref}.Q${QRY[${SGE_TASK_ID}]}.cslong.paf
