#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/out.gather_major_alleles/
#$ -e log/err.gather_major_alleles/

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

cat <(cat ./092_variants_in_common_vcf/${REFERENCE[${SGE_TASK_ID}]}.norm.isecjg1aandjg1b/0002.vcf | grep -v ^#) \
    <(cat ./092_variants_in_common_vcf/${REFERENCE[${SGE_TASK_ID}]}.norm.isecjg1bandjg1c/0002.vcf | grep -v ^#) \
    <(cat ./092_variants_in_common_vcf/${REFERENCE[${SGE_TASK_ID}]}.norm.isecjg1candjg1a/0002.vcf | grep -v ^#) \
| sort -k1,1 -k2,2n \
> ./132_major_biallelic_vcf/${REFERENCE[${SGE_TASK_ID}]}.major.biallelic.noheader.vcf
