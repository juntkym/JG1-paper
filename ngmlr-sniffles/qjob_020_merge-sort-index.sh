#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/merge
#$ -e log/merge

#$ -pe def_slot 12
#$ -l s_vmem=4G,mem_req=4G

#$ -hold_jid qjob_010_ngmlrv027.${sample}.GRCh38.sh

rm -rf sam${sample}

samtools merge \
    GRCh38.pac.${sample}.ngmlr.merged.bam \
    ./bam${sample}/GRCh38.pac.${sample}.*.ngmlr.bam

samtools sort \
    -O bam \
    -T tmp${sample} \
    -@ 11 \
    GRCh38.pac.${sample}.ngmlr.merged.bam \
    -o GRCh38.pac.${sample}.ngmlr.merged.sorted.bam \
&& rm -rf GRCh38.pac.${sample}.ngmlr.merged.bam \

samtools index \
    GRCh38.pac.${sample}.ngmlr.merged.sorted.bam 
