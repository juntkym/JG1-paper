#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/out.gather_to_be_replaced/
#$ -e log/err.gather_to_be_replaced/

#$ -t 1-12:1

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

cat ./132_major_biallelic_vcf/${REFERENCE[${SGE_TASK_ID}]}.major.biallelic.noheader.vcf \
    ./122_tri-allelic_vcf/${REFERENCE[${SGE_TASK_ID}]}.vcf \
| sort -k1,1 -k2,2n \
> ./142_to_be_replaced_vcf/${REFERENCE[${SGE_TASK_ID}]}.tobereplaced.major.tri.noheader.vcf
