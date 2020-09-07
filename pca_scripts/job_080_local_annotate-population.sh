#!/bin/bash

thiscohort="hapmapJPT.jg1abc"

echo -e "haplotype\tPC1\tPC2\tPC3\tname\tpopulation\ttype" \
  > ${thiscohort}.pruning.in.shortid.pca.evec.population.tsv

join -a 1 -1 1 -2 1 \
     -o 1.2 1.3 1.4 1.5 2.1 2.2 2.4\
     <(cat ${thiscohort}.pruning.in.shortid.pca.evec \
         | awk 'BEGIN{
                  OFS="\t"
                }
                NR>=2{
                  split($1,name,":");
                  gsub("_1","",name[1]); 
                  gsub("_2","",name[1]); 
                  print name[1],$1,$2,$3,$4
                }' \
         | sort) \
     <(cat ../info/sample-population-pedigree.type.table | sort) \
         | sed -e 's/ /\t/g' \
  >> ${thiscohort}.pruning.in.shortid.pca.evec.population.tsv
