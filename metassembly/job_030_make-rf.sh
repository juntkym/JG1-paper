#!/bin/bash

zcat ${sample}_R1.mp.fastq.gz \
  | seqkit seq --reverse --complement \
  > ${sample}_R1.mp.rf.fastq

bgzip ${sample}_R1.mp.rf.fastq

zcat ${sample}_R2.mp.fastq.gz \
  | seqkit seq --reverse --complement \
  > ${sample}_R2.mp.rf.fastq

bgzip ${sample}_R2.mp.rf.fastq
