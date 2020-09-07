#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -pe def_slot 24

#$ -hold_jid mergebam.sh

set -eux

sample=jg1a

samtools index -b \
  -@22 ${sample}-arrow.scaffold.rename.merged.bwamem.markdup.bam