#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 4


export PYTHONUSERBASE=/path/to/metasm_env
export PATH=$PYTHONUSERBASE/bin:$PATH

sample1=jg1a
sample2=jg1b
sample3=jg1c

####### Metassemble

asseMerge   -R /path/to/bowtie2.R${sample1}/merge/${sample1}.CEstat/${sample1}.ce/${sample1}-arrow.draft.${sample1}.${sample2}.${sample3}.mp.rf.mateAn \
            -r bowtie2.R${sample1}/merge/${sample1}-arrow.draft.fa.Ns \
            -Q /path/to/bowtie2.R${sample2}/merge/${sample2}.CEstat/${sample2}.ce/${sample2}-arrow.draft.${sample1}.${sample2}.${sample3}.mp.rf.mateAn \
            -q bowtie2.R${sample2}/merge/${sample2}-arrow.draft.fa.Ns \
            -D nucmer/merge/Q${sample2}.R${sample1}.1delta \
            -M nucmer/merge/Q${sample2}.R${sample1}.1coords \
            -O assemerge.3libs/Q${sample2}.R${sample1}.3libs.n30 \
            -x Q${sample2}.R${sample1}.3libs.n30 \
            -i 5 \
            -c 6

meta2fasta --out assemerge.3libs/Q${sample2}.R${sample1}.3libs.n30 \
           --meta assemerge.3libs/Q${sample2}.R${sample1}.3libs.n30.metassem \
           --fastas ${sample1}-arrow.draft.fa ${sample2}-arrow.draft.fa
