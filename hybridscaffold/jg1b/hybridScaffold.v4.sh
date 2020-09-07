#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 20
#$ -l tmem,mem_req=82G,s_vmem=82G

# working directory
export workdir=/path/to/workdir

/usr/bin/perl /path/to/Solve3.2.1_04122018/HybridScaffold/04122018/hybridScaffold.pl \
	-n /path/to/arrow/jg1b-p_ctg.arrow.fa\
	-b /path/to/bionano/jg1b/contigs/exp_refineFinal1/EXP_REFINEFINAL1.cmap\
	-c /path/to/hybridscaffold/jg1b/hybridScaffold_DLE1_config.tmem.xml \
	-r /path/to/Solve3.2.1_04122018/RefAligner/7437.7523rel/avx/RefAligner \
	-o ${workdir} \
	-B 2 \
	-N 2 \
	-f \
	-e /path/to/contigs/auto_noise/autoNoise1.errbin\
