#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/ngmlr/
#$ -e log/ngmlr/

#$ -pe def_slot 8
#$ -l s_vmem=4G,mem_req=4G

#$ -t 1-1:1

mkdir -p sam${sample}
mkdir -p bam${sample}

/path/to/bin/ngmlr-0.2.7/ngmlr \
    -t 7 \
    -x pacbio \
    -r /path/to/GRCh38.fa \
    -q ./subreads${sample}/pacbio${SGE_TASK_ID}.fasta \
    -o ./sam${sample}/GRCh38.pac.${sample}.${SGE_TASK_ID}.ngmlr.sam

samtools view \
    -Sb ./sam${sample}/GRCh38.pac.${sample}.${SGE_TASK_ID}.ngmlr.sam \
    > ./bam${sample}/GRCh38.pac.${sample}.${SGE_TASK_ID}.ngmlr.bam \
