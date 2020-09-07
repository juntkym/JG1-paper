#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 4
#$ -t 1-1893:1

#$ -hold_jid mergeindex.sh

set -eu
trap 'exit 100' ERR
trap 'exit 100' SIGXCPU

# array of scaffolds
# SCAFFOLD=(
# [1]="Super-Scaffold_3"
# [2]="Super-Scaffold_127"
# [3]="Super-Scaffold_291"
# ...
# [1893]="000954F_arrow_obj"
# )

samtools view \
  -@ 4 \
  -b ${sample}-arrow.scaffold.rename.merged.bwamem.markdup.bam \
  ${SCAFFOLD[${SGE_TASK_ID}]} \
  > ./splitbam/${sample}-arrow.scaffold.rename.merged.bwamem.markdup.${SCAFFOLD[${SGE_TASK_ID}]}.bam

samtools index \
  -@ 4 \
  ./splitbam/${sample}-arrow.scaffold.rename.merged.bwamem.markdup.${SCAFFOLD[${SGE_TASK_ID}]}.bam

