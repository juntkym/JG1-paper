#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 24

#$ -hold_jid mkindex_pilon.sh

set -eux

export JAVA_TOOL_OPTIONS="-XX:+UseSerialGC -XX:CICompilerCount=2"

export READ1="/path/to/R1.fastq.gz"
export READ2="/path/to/R2.fastq.gz"

sample=jg1a # jg1a, jg1b, jg1c

/path/to/bwa/0.7.17/bwa mem\
	-t 22\
	-K 1000000\
	-R '@RG\tID:${sample}-162PE\tPT:ILLUMINA\tPU:162PE\tB:ToMMo:\tSM:${sample}'\
	${sample}-arrow.scaffold.rename\
	${READ1}\
	${READ2}\
| java -jar /path/to/bin/picard-2.18.4/picard.jar SortSam\
	INPUT=/dev/stdin\
	OUTPUT=${sample}-arrow.scaffold.rename.162PE.bwamem.bam\
	TMP_DIR=${sample}-arrow.scaffold.rename.162PE.bwamem.bam.tmp\
	SORT_ORDER=coordinate\
	COMPRESSION_LEVEL=1
