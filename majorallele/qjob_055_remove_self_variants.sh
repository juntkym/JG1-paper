#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/out.remove_self
#$ -e log/err.remove_self

#$ -t 1-12:1

GENOMES=(
[1]="jg1a.jg1b-jg1c"
[2]="jg1a.jg1c-jg1b"
[3]="jg1a-jg1b.jg1c"
[4]="jg1a-jg1c.jg1b"
[5]="jg1b.jg1a-jg1c"
[6]="jg1b.jg1c-jg1a"
[7]="jg1b-jg1a.jg1c"
[8]="jg1b-jg1c.jg1a"
[9]="jg1c.jg1a-jg1b"
[10]="jg1c.jg1b-jg1a"
[11]="jg1c-jg1a.jg1b"
[12]="jg1c-jg1b.jg1a"
)

REVGENOMES=(
[1]="Qjg1b-jg1c.Rjg1a"
[2]="Qjg1c-jg1b.Rjg1a"
[3]="Qjg1c.Rjg1a-jg1b"
[4]="Qjg1b.Rjg1a-jg1c"
[5]="Qjg1a-jg1c.Rjg1b"
[6]="Qjg1c-jg1a.Rjg1b"
[7]="Qjg1c.Rjg1b-jg1a"
[8]="Qjg1a.Rjg1b-jg1c"
[9]="Qjg1a-jg1b.Rjg1c"
[10]="Qjg1b-jg1a.Rjg1c"
[11]="Qjg1b.Rjg1c-jg1a"
[12]="Qjg1a.Rjg1c-jg1b"
)

bedtools intersect -v -a ./no_hetero_vcf/R${GENOMES[${SGE_TASK_ID}]}.Qjg1a.nohetero.cslong.vcf \
                      -b ./originbed/${REVGENOMES[${SGE_TASK_ID}]}.fromjg1a.bed \
                       > ./no_hetero_no_self_vcf/R${GENOMES[${SGE_TASK_ID}]}.Qjg1a.nohetero.noself.cslong.vcf

bedtools intersect -v -a ./no_hetero_vcf/R${GENOMES[${SGE_TASK_ID}]}.Qjg1b.nohetero.cslong.vcf \
                      -b ./originbed/${REVGENOMES[${SGE_TASK_ID}]}.fromjg1b.bed \
                       > ./no_hetero_no_self_vcf/R${GENOMES[${SGE_TASK_ID}]}.Qjg1b.nohetero.noself.cslong.vcf

bedtools intersect -v -a ./no_hetero_vcf/R${GENOMES[${SGE_TASK_ID}]}.Qjg1c.nohetero.cslong.vcf \
                      -b ./originbed/${REVGENOMES[${SGE_TASK_ID}]}.fromjg1c.bed \
                       > ./no_hetero_no_self_vcf/R${GENOMES[${SGE_TASK_ID}]}.Qjg1c.nohetero.noself.cslong.vcf
