# PYTHON
export PYTHONUSERBASE=/path/to/venv275
export PATH=$PYTHONUSERBASE/bin:$PATH

# DRMAA
export DRMAA_LIBRARY_PATH=/path/to/UGE/lib/lx-amd64/libdrmaa.so.1.0

# working directory
export workdir=/path/to/workdir

# BNG de novo assembly
python /path/to/Solve3.1_08232017/Pipeline/08212017/pipelineCL.py \
	-T 128 \
	-j 8 \
	-f 0.2 \
	-i 5 \
	-r /path/to/contigs/exp_mrg0/EXP_MRG0A.cmap \
	-y \
	-b /path/to/93224_ToMMo_blood_NtBspQI_2016-02-10_14_16/Detect\ Molecules/Molecules.bnx \
	-l ${workdir}/full \
	-t /path/to/Solve3.1_08232017/RefAligner/6700.6902rel/avx/ \
	-a /path/to/Solve3.1_08232017/RefAligner/6700.6902rel/optArguments_nonhaplotype_irys.xml \
	-C ${workdir}/clusterArguments_jt21.xml \
	-V 0 \
	-m