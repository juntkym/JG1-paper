#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/out.extract.tri-allelic.candidate/
#$ -e log/err.extract.tri-allelic.candidate/

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


mkdir ./112_tri-allelic_candidate_vcf/${REFERENCE[${SGE_TASK_ID}]}

# extract variant sites shared between jg1a and jg1b
cat \
    ./102_private_variants_vcf/${REFERENCE[${SGE_TASK_ID}]}/0000.vcf \
    ./102_private_variants_vcf/${REFERENCE[${SGE_TASK_ID}]}/0001.vcf \
| grep -v ^# \
| sort -k1,1 -k2,2n \
| awk '$1==prev1 && $2==prev2 {print prev0; print}{prev1=$1; prev2=$2; prev0=$0}' \
    > ./112_tri-allelic_candidate_vcf/${REFERENCE[${SGE_TASK_ID}]}/shared_betweenjg1aandjg1b.vcf

# extract variant sites shared between 02 and jg1c
cat \
    ./102_private_variants_vcf/${REFERENCE[${SGE_TASK_ID}]}/0001.vcf \
    ./102_private_variants_vcf/${REFERENCE[${SGE_TASK_ID}]}/00jg1b.vcf \
| grep -v ^# \
| sort -k1,1 -k2,2n \
| awk '$1==prev1 && $2==prev2 {print prev0; print}{prev1=$1; prev2=$2; prev0=$0}' \
    > ./112_tri-allelic_candidate_vcf/${REFERENCE[${SGE_TASK_ID}]}/shared_betweenjg1bandjg1c.vcf

# extract variant sites shared between jg1c and jg1a
cat \
    ./102_private_variants_vcf/${REFERENCE[${SGE_TASK_ID}]}/0002.vcf \
    ./102_private_variants_vcf/${REFERENCE[${SGE_TASK_ID}]}/0000.vcf \
| grep -v ^# \
| sort -k1,1 -k2,2n \
| awk '$1==prev1 && $2==prev2 {print prev0; print}{prev1=$1; prev2=$2; prev0=$0}' \
    > ./112_tri-allelic_candidate_vcf/${REFERENCE[${SGE_TASK_ID}]}/shared_betweenjg1candjg1a.vcf