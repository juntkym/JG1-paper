#!/bin/bash

export PYTHONUSERBASE=/path/to/venv275
export PATH=$PYTHONUSERBASE/bin:$PATH

# DRMAA
export DRMAA_LIBRARY_PATH=/path/to/UGE/lib/lx-amd64/libdrmaa.so.1.0

# working directory
export workdir=/path/to/workdir

# BNG de novo assembly
python /path/to/Solve3.2.1_04122018/Pipeline/04122018/pipelineCL.py\
     -l ${workdir}\
     -t /path/to/Solve3.2.1_04122018/RefAligner/7437.7523rel/avx/\
     -C /path/to/clusterArgumentsBG_saphyr_phi_jt5.xml\
     -b /path/to/all.bnx\
     -i 5\
     -a /path/to/Solve3.2.1_04122018/RefAligner/7437.7523rel/optArguments_nonhaplotype_DLE1_saphyr_human.xml\
	 -r /path/to/contigs_roughAssembly/exp_mrg0/EXP_MRG0.cmap\
	 -y \
     -f 0\
     -J 22\
     -T 42\
     -N 4\
     -V 0\