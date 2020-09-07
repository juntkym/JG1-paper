#!/bin/bash
#$ -S /bin/bash
#$ -cwd

#$ -o log/sortvcf/
#$ -e log/sortvcf/

#$ -t 1-3:1

sample=(
[1]="jg1a"
[2]="jg1b"
[3]="jg1c"
)

cat vcf/GRCh38.pac.${sample[${SGE_TASK_ID}]}.ngmlr.merged.sorted.bam.sniffles.vcf \
    | /path/to/VCFtools/0.1.15/bin/vcf-sort \
    > sortedvcf/GRCh38.pac.${sample[${SGE_TASK_ID}]}.ngmlr.merged.sorted.bam.sniffles.sorted.vcf
