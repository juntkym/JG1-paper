#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 2
#$ -l s_vmem=96G,mem_req=96G
#$ -soft -l tmem,lmem

#$ -hold_jid bwamem259.sh

set -eux

export JAVA_TOOL_OPTIONS="-XX:+UseSerialGC -XX:CICompilerCount=2"

sample=jg1a

# Usage example: java -jar picard.jar MarkDuplicates I=input.bam O=marked_duplicates.bam M=marked_dup_metrics.txt
/path/to/bin/ibm-java-80-8.0.5.1/bin/java -Xmx180G -jar /path/to/bin/picard-2.18.4/picard.jar MarkDuplicates\
	INPUT=${sample}-arrow.scaffold.rename.259PE.bwamem.bam\
	OUTPUT=${sample}-arrow.scaffold.rename.259PE.bwamem.markdup.bam\
	METRICS_FILE=${sample}-arrow.scaffold.rename.259PE.bwamem.bam.markdup_metrics\
	TMP_DIR=${sample}-arrow.scaffold.rename.259PE.bwamem.markdup.bam.tmp\
	COMPRESSION_LEVEL=6\
	CREATE_INDEX=true\
	ASSUME_SORTED=true\
	VALIDATION_STRINGENCY=LENIENT
