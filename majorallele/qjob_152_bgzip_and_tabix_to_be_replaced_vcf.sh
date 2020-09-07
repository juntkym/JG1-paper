#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o ./log/out.bgzip.tabix.tobereplaced/
#$ -e ./log/err.bgzip.tabix.tobereplaced/

#$ -t 1-12:1

PARAMS=(
[1]="152_to_be_replaced_vcf_with_header/Rjg1a.jg1b-jg1c.tobereplaced.major.tri.header.vcf"
[2]="152_to_be_replaced_vcf_with_header/Rjg1a.jg1c-jg1b.tobereplaced.major.tri.header.vcf"
[3]="152_to_be_replaced_vcf_with_header/Rjg1a-jg1b.jg1c.tobereplaced.major.tri.header.vcf"
[4]="152_to_be_replaced_vcf_with_header/Rjg1a-jg1c.jg1b.tobereplaced.major.tri.header.vcf"
[5]="152_to_be_replaced_vcf_with_header/Rjg1b.jg1a-jg1c.tobereplaced.major.tri.header.vcf"
[6]="152_to_be_replaced_vcf_with_header/Rjg1b.jg1c-jg1a.tobereplaced.major.tri.header.vcf"
[7]="152_to_be_replaced_vcf_with_header/Rjg1b-jg1a.jg1c.tobereplaced.major.tri.header.vcf"
[8]="152_to_be_replaced_vcf_with_header/Rjg1b-jg1c.jg1a.tobereplaced.major.tri.header.vcf"
[9]="152_to_be_replaced_vcf_with_header/Rjg1c.jg1a-jg1b.tobereplaced.major.tri.header.vcf"
[10]="152_to_be_replaced_vcf_with_header/jg1c.jg1b-jg1a.tobereplaced.major.tri.header.vcf"
[11]="152_to_be_replaced_vcf_with_header/jg1c-jg1a.jg1b.tobereplaced.major.tri.header.vcf"
[12]="152_to_be_replaced_vcf_with_header/jg1c-jg1b.jg1a.tobereplaced.major.tri.header.vcf"
)

bgzip ${PARAMS[${SGE_TASK_ID}]}
tabix ${PARAMS[${SGE_TASK_ID}]}.gz
