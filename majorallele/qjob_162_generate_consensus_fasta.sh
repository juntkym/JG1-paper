#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o ./log/out.get_consensus_fasta/
#$ -e ./log/err.get_consensus_fasta/

#$ -t 1-12:1

REFERENCE=(
[1]="jg1a.jg1b-jg1c"
[2]="jg1a.jg1c-jg1b"
[3]="jg1a-jg1b.jg1c"
[4]="jg1a-jg1c.jg1b"
[5]="jg1b.jg1a-jg1c"
[6]="jg1b.jg1c-jg1a"
[7]="jg1b-jg1a.jg1c"
[8]="jg1b-jg1c.jg1a"
[9]="jg1c.jg1a-jg1b"
[10]="jg1c.jg1b-jg1a"
[11]="jg1c-jg1a.jg1b"
[12]="jg1c-jg1b.jg1a"
)

bcftools consensus \
    --fasta-ref ./000_data/triple_merged_genome/${REFERENCE[${SGE_TASK_ID}]}-arrow.draft.fa \
    ./152_to_be_replaced_vcf_with_header/R${REFERENCE[${SGE_TASK_ID}]}.tobereplaced.major.tri.header.vcf.gz \
    --output ./162_consensus_fasta/${REFERENCE[${SGE_TASK_ID}]}-arrow.draft.cns.fa
