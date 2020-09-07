#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -o ./log/out.paftools/
#$ -e ./log/err.paftools/

#$ -pe def_slot 1
#$ -l tmem,s_vmem=192G,mem_req=192G

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

sort -k6,6 -k8,8n \
    ./paf/R${ref}-jg1c.Q${QRY[${SGE_TASK_ID}]}.cslong.paf \
| paftools.js call \
    -f ./data/triple_merged_genome/${ref}-arrow.draft.fa \
    - \
    > ./vcf/R${ref}.Q${QRY[${SGE_TASK_ID}]}.cslong.vcf
