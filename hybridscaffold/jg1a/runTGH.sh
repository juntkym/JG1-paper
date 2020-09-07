#!/bin/sh
#!/bin/bash
#$ -cwd

#$ -pe def_slot 2
#$ -l tmem,s_vmem=800G,mem_req=800G

# R and Rscript
export LD_LIBRARY_PATH=/path/to/R/3.4.2/settings/lib/pcre/8.41/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/path/to/R/3.4.2/settings/lib/xz/5.2.3/lib:$LD_LIBRARY_PATH
export PATH=/path/to/R/3.4.2/bin:${PATH}

Rscript /path/to/Solve3.2.1_04122018/HybridScaffold/04122018/runTGH.R\
    -N /path/to/arrow/jg1a-p_ctg.arrow.fa\
    -b1 /path/to/jg1a/BspQI/full/contigs/exp_refineFinal1/EXP_REFINEFINAL1.cmap\
    -b2 /path/to/jg1a/BssSI/full/contigs/exp_refineFinal1/EXP_REFINEFINAL1.cmap\
    -e1 BSPQI \
    -e2 BSSSI \
    -O /path/to/hybridscaffold/jg1a.arrow\
    -R /path/to/Solve3.2.1_04122018/RefAligner/7437.7523rel/avx/RefAligner\
    /path/to/Solve3.2.1_04122018/HybridScaffold/04122018/TGH/hybridScaffold_two_enzymes.xml
