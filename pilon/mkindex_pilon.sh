#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 24

#$ -hold_jid preparefa.sh

set -eux

sample=jg1a

/path/to/bwa/0.7.17/bwa index \
  -p ${sample}-arrow.scaffold.rename \
  ${sample}-arrow.scaffold.rename.fa
