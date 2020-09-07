#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/out.bgzip.tabix/
#$ -e log/err.bgzip.tabix/

#$ -t 1-36:1

# array of vcf files
# PARAMS=(
# [1]="/no_hetero_no_self_vcf_with_header/Rjg1a.jg1b-jg1c.Qjg1a.nohetero.noself.cslong.header.vcf"
# [2]="/no_hetero_no_self_vcf_with_header/Rjg1a.jg1b-jg1c.Qjg1b.nohetero.noself.cslong.header.vcf"
# ..
# [36]="/no_hetero_no_self_vcf_with_header/Rjg1c-jg1b.jg1a.Qjg1c.nohetero.noself.cslong.header.vcf"
# )

bgzip ${PARAMS[${SGE_TASK_ID}]}
tabix ${PARAMS[${SGE_TASK_ID}]}.gz

