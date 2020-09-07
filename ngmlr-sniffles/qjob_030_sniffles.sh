#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/sniffles/
#$ -e log/sniffles/

#$ -pe def_slot 8

#$ -hold_jid qjob_020_merge-sort-index-${sample}.sh

/path/to/bin/Sniffles-1.0.11/bin/sniffles-core-1.0.11/sniffles \
    --threads       7 \
    --min_support   30 \
    --mapped_reads  GRCh38.pac.${sample}.ngmlr.merged.sorted.bam \
    --vcf           GRCh38.pac.${sample}.ngmlr.merged.sorted.bam.sniffles.vcf \
    --tmp_file      ./sniffles.tmp${sample}
