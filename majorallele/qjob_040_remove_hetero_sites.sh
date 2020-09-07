#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/out.remove_hetero/
#$ -e log/err.remove_hetero/

#$ -hold_jid paftools.call.Rjg1a.jg1b-jg1c-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1a.jg1c-jg1b-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1a-jg1b.jg1c-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1a-jg1c.jg1b-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1b.jg1a-jg1c-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1b.jg1c-jg1a-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1b-jg1a.jg1c-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1b-jg1c.jg1a-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1c.jg1a-jg1b-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1c.jg1b-jg1a-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1c-jg1a.jg1b-arrow.draft.array.sh
#$ -hold_jid paftools.call.Rjg1c-jg1b.jg1a-arrow.draft.array.sh

#$ -t 1-12:1

REF=(
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

QRY=(
[1]="jg1a"
[2]="jg1b"
[3]="jg1c"
)

# for jg1a
cat ./vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[1]}.cslong.vcf \
    | awk '$1==prev1 && $2==prev2 {print prev0; print}{prev1=$1; prev2=$2;  prev0=$0}'\
     > ./hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[1]}.hetero.cslong.vcf

cat ./vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[1]}.cslong.vcf \
    | grep -vf ./hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[1]}.hetero.cslong.vcf \
    > ./no_hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[1]}.nohetero.cslong.vcf

# for jg1b
cat ./vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[2]}.cslong.vcf \
    | awk '$1==prev1 && $2==prev2 {print prev0; print}{prev1=$1; prev2=$2;  prev0=$0}'\
     > ./hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[2]}.hetero.cslong.vcf

cat ./vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[2]}.cslong.vcf \
    | grep -vf ./hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[2]}.hetero.cslong.vcf \
    > ./no_hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[2]}.nohetero.cslong.vcf

# for jg1c
cat ./vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[3]}.cslong.vcf \
    | awk '$1==prev1 && $2==prev2 {print prev0; print}{prev1=$1; prev2=$2;  prev0=$0}'\
     > ./hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[3]}.hetero.cslong.vcf

cat ./vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[3]}.cslong.vcf \
    | grep -vf ./hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[3]}.hetero.cslong.vcf \
    > ./no_hetero_vcf/R${REF[${SGE_TASK_ID}]}.Q${QRY[3]}.nohetero.cslong.vcf
