#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 24
#$ -hold_jid split.and.index.sh
#$ -t 1-1893:1

set -eu
trap 'exit 100' ERR
trap 'exit 100' SIGXCPU

# array of scaffold names
# SCAFFOLD=(
# [1]="Super-Scaffold_3"
# [2]="Super-Scaffold_127"
# [3]="Super-Scaffold_291"
# 
# [1893]="000954F_arrow_obj"
# )

/path/to/bin/ibm-java-80-8.0.5.1/bin/java -Xmx90G -jar /path/to/bin/pilon-1.22-modified/pilon_2.11-1.22-one-jar.jar\
        --threads 22\
        --genome ./eachscfs/${SCAFFOLD[${SGE_TASK_ID}]}.fa\
        --bam ./splitbam/${sample}-arrow.scaffold.rename.merged.bwamem.markdup.${SCAFFOLD[${SGE_TASK_ID}]}.bam\
        --output ${SCAFFOLD[${SGE_TASK_ID}]}.pilon\
        --outdir ./pilon_output\
        --diploid \
        --changes \
        --vcf \
        --tracks

