#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/out.extract.private/
#$ -e log/err.extract.private/

#$ -t 1-12

REFERENCE=(
[1]="Rjg1a.jg1b-jg1c"
[2]="Rjg1a.jg1c-jg1b"
[3]="Rjg1a-jg1b.jg1c"
[4]="Rjg1a-jg1c.jg1b"
[5]="Rjg1b.jg1a-jg1c"
[6]="Rjg1b.jg1c-jg1a"
[7]="Rjg1b-jg1a.jg1c"
[8]="Rjg1b-jg1c.jg1a"
[9]="Rjg1c.jg1a-jg1b"
[10]="Rjg1c.jg1b-jg1a"
[11]="Rjg1c-jg1a.jg1b"
[12]="Rjg1c-jg1b.jg1a"
)

bcftools isec \
    ./082_no_hetero_no_self_vcf_with_header_norm/${REFERENCE[${SGE_TASK_ID}]}.Qjg1a.nohetero.noself.cslong.header.norm.vcf.gz \
    ./082_no_hetero_no_self_vcf_with_header_norm/${REFERENCE[${SGE_TASK_ID}]}.Qjg1b.nohetero.noself.cslong.header.norm.vcf.gz \
    ./082_no_hetero_no_self_vcf_with_header_norm/${REFERENCE[${SGE_TASK_ID}]}.Qjg1c.nohetero.noself.cslong.header.norm.vcf.gz \
    -p ./102_private_variants_vcf/${REFERENCE[${SGE_TASK_ID}]} \
    -n-1 \
