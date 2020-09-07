#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 2
#$ -soft -l tmem,lmem
#$ -l s_vmem=96G,mem_req=96G

#$ -hold_jid markdup162.sh
#$ -hold_jid markdup259.sh

set -eux

export JAVA_TOOL_OPTIONS="-XX:+UseSerialGC -XX:CICompilerCount=2"

sample=jg1a

/path/to/bin/ibm-java-80-8.0.5.1/bin/java -Xmx180G -jar /path/to/bin/picard-2.18.4/picard.jar MergeSamFiles \
    INPUT=${sample}-arrow.scaffold.rename.162PE.bwamem.markdup.bam\
    INPUT=${sample}-arrow.scaffold.rename.259PE.bwamem.markdup.bam\
    OUTPUT=${sample}-arrow.scaffold.rename.merged.bwamem.markdup.bam\
    SORT_ORDER=coordinate
