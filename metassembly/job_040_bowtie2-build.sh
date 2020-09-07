#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -pe def_slot 24

export PYTHONUSERBASE=/path/to/metasm_env
export PATH=$PYTHONUSERBASE/bin:$PATH

sample=jg1a

mkdir merge
mkdir merge/${sample}.CEstat
mkdir merge/${sample}.CEstat/BWTaln
mkdir merge/${sample}.CEstat/${sample}.ce

bowtie2-build --threads 24\
	--seed 100\
	${sample}-arrow.draft.fa\
	merge/${sample}.CEstat/BWTaln/${sample}

Ncoords -N ${sample}-arrow.draft.fa\
	-D merge
