#!/bin/bash


# for jg1a, b, c
genomes=(jg1a.ragoo jg1b.ragoo jg1c.ragoo)

condition=bi-allelic
for name in ${genomes[@]}; do 
  for suffix in bed bim fam; do
    echo  ${name}
    mkdir -p ${name}
    ln -s /path/to/component/${name}/hapmap3_r2_b36_all.lifted${name}.ucsc.getfasta.${condition}.${suffix} \
          ${name}/hapmap3_r2_b36_all.lifted${name}.ucsc.getfasta.${condition}.${suffix}
  done
done

# for base cohort

basecohort=hapmap3_r2_b36_all.filter.JPT

for suffix in bed bim fam; do
  echo  ${basecohort}
  mkdir -p ${basecohort}
  ln -s /path/to/component/${basecohort}/${basecohort}.${suffix} \
        ${basecohort}/${basecohort}.${suffix}
done

