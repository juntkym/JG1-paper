#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -pe def_slot 2

#$ -t 1-36:1

PARAMS=(
[1]="080_no_hetero_no_self_vcf_with_header/Rjg1a.jg1b-jg1c.Qjg1a.nohetero.noself.cslong.header.vcf.gz"
[2]="080_no_hetero_no_self_vcf_with_header/Rjg1a.jg1b-jg1c.Qjg1b.nohetero.noself.cslong.header.vcf.gz"
# omit ..
[36]="080_no_hetero_no_self_vcf_with_header/Rjg1c-jg1b.jg1a.Qjg1c.nohetero.noself.cslong.header.vcf.gz"
)

OUTPUT=(
[1]="082_no_hetero_no_self_vcf_with_header_norm/Rjg1a.jg1b-jg1c.Qjg1a.nohetero.noself.cslong.header.norm.vcf.gz"
[2]="082_no_hetero_no_self_vcf_with_header_norm/Rjg1a.jg1b-jg1c.Qjg1b.nohetero.noself.cslong.header.norm.vcf.gz"
# omit ..
[36]="082_no_hetero_no_self_vcf_with_header_norm/Rjg1c-jg1b.jg1a.Qjg1c.nohetero.noself.cslong.header.norm.vcf.gz"
)

REFERENCE=(
[1]="000_data/triple_merged_genome/jg1a.jg1b-jg1c-arrow.draft.fa"
[2]="000_data/triple_merged_genome/jg1a.jg1b-jg1c-arrow.draft.fa"
# omit ..
[36]="000_data/triple_merged_genome/jg1c-jg1b.jg1a-arrow.draft.fa"
)

bcftools norm\
    ${PARAMS[${SGE_TASK_ID}]}\
    --fasta-ref ${REFERENCE[${SGE_TASK_ID}]}\
    --multiallelics -both\
    --output-type z\
    --threads 1\
    --output ${OUTPUT[${SGE_TASK_ID}]}
