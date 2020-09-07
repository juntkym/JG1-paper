#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -pe def_slot 24

#$ -hold_jid bowtie2.R${sample1}.build.sh

export PYTHONUSERBASE=/home/jrgv3/metasm_env
export PATH=$PYTHONUSERBASE/bin:$PATH

bowtie2 --threads 24\
	-x merge/${sample1}.CEstat/BWTaln/${sample1}\
	-1 /path/to/${sample1}_nxtrim__R1.mp.rf.fastq.gz\
	-2 /path/to/${sample1}_nxtrim__R2.mp.rf.fastq.gz\
	--minins 1000\
	--maxins 16000\
	--rf\
	1> merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.sam\
	2> merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.err

mateAn  -A 2000\
	-B 15000\
	-a merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.sam\
	-p merge/${sample1}.CEstat/${sample1}.ce/${sample1}-arrow.draft.${sample1}.mp.rf

samtools view -@ 24\
	-S -b -1\
	./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.sam\
	-o ./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.bam\

samtools sort -@ 24\
	./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.bam\
	-T ./merge/${sample1}.CEstat/BWTaln/sort.tmp\
	-o ./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.sort.bam\

pigz -p 24 ./merge/${sample1}.CEstat/BWTaln/${sample1}-arrow.draft.${sample1}.mp.rf.sam
