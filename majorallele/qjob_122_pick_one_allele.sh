#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -o log/err.pick_one_allele/
#$ -e log/out.pick_one_allele/

#$ -t 1-12:1

REFERENCE=(
[1]="Rjg1a.jg1b-jg1c"
[2]="Rjg1a.jg1c-jg1b"
[3]="Rjg1a-jg1b.jg1c"
[4]="Rjg1a-jg1c.jg1b"
[5]="Rjg1b.jg1a-jg1c"
[6]="Rjg1b.jg1c-jg1a"
[7]="Rjg1b-jg1a.jg1c"
[8]="Rjg1b-jg1c.jg1a"
[9]="Rjg1c.jg1a-jg1b"
[10]="Rjg1c.jg1b-jg1a"
[11]="Rjg1c-jg1a.jg1b"
[12]="Rjg1c-jg1b.jg1a"
)

cat \
    ./112_tri-allelic_candidate_vcf/${REFERENCE[${SGE_TASK_ID}]}/shared_betweenjg1aandjg1b.vcf \
    ./112_tri-allelic_candidate_vcf/${REFERENCE[${SGE_TASK_ID}]}/shared_betweenjg1bandjg1c.vcf \
    ./112_tri-allelic_candidate_vcf/${REFERENCE[${SGE_TASK_ID}]}/shared_betweenjg1candjg1a.vcf \
| awk 'NR%2==1{
         prev0=$0; 
         prevlen+=length($0)
       }
       NR%2==0{
         srand(length($0)+prevlen); 
         a=rand(); 
         if(a<1/3){
           print prev0
         } else if (a<2/3){ 
           print $0
         } 
         prevlen+=length($0)
       }' \
| sort -k1,1 -k2,2n \
> 122_tri-allelic_vcf/${REFERENCE[${SGE_TASK_ID}]}.vcf
