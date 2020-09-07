#!/bin/bash

thiscohort="hapmapJPT.jg1abc"
output="par.PED.EIGENSTRAT.pruning.in"

echo "genotypename:    ${thiscohort}.pruning.in.shortid.ped"            >  ${output}
echo "snpname:         ${thiscohort}.pruning.in.shortid.map"            >> ${output}
echo "indivname:       ${thiscohort}.pruning.in.shortid.ped"            >> ${output}
echo "outputformat:    EIGENSTRAT"                                      >> ${output}
echo "genotypeoutname: ${thiscohort}.pruning.in.shortid.eigenstratgeno" >> ${output}
echo "snpoutname:      ${thiscohort}.pruning.in.shortid.snp"            >> ${output}
echo "indivoutname:    ${thiscohort}.pruning.in.shortid.ind"            >> ${output}
echo "familynames:     YES"                                             >> ${output}

