#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 24

export PYTHONUSERBASE=/path/to/metasm_env
export PATH=$PYTHONUSERBASE/bin:$PATH

nucmer --maxmatch\
	-c 50 \
	-l 300 \
	-p merge/Q${sample2}.R${sample1}\
	${sample1}-arrow.draft.fa\
	${sample2}-arrow.draft.fa\

delta-filter -1 \
	./merge/Q${sample2}.R${sample1}.delta\
	> ./merge/Q${sample2}.R${sample1}.1delta

show-coords -cHlTr \
	./merge/Q${sample2}.R${sample1}.1delta\
	> ./merge/Q${sample2}.R${sample1}.1coords
