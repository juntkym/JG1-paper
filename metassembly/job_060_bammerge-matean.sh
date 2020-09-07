#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 24

#$ -hold_jid bowtie2.R${sample1}.Q${sample1}.sh
#$ -hold_jid bowtie2.R${sample1}.Q${sample2}.sh
#$ -hold_jid bowtie2.R${sample1}.Q${sample3}.sh

sample1=jg1a
sample2=jg1b
sample3=jg1c

export PYTHONUSERBASE=/path/to/metasm_env
export PATH=$PYTHONUSERBASE/bin:$PATH

samtools merge  -@ 24\
	./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.all.mp.rf.bam \
	./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.sort.bam \
	./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample2}.mp.rf.sort.bam \
	./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample3}.mp.rf.sort.bam \

samtools view -@ 24\
        -O SAM\
        ./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.all.mp.rf.bam \
        > ./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.all.mp.rf.sam

mateAn  -A 2000\
        -B 15000\
        -a merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.all.mp.rf.sam\
        -p merge/${sample1}.CEstat/${sample1}.ce/${sample1}-arrow.draft.all.mp.rf

pigz -p 24 merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.all.mp.rf.sam
