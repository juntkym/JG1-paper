#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 2
#$ -hold_jid pilon.sh
set -eux

sample=jg1a
cat ./pilon_output/*.fa* > ${sample}-arrow.draft.fa
