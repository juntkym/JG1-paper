#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 8

#$ -hold_jid hybridScaffold.v4.sh

cat /path/to/hybridscaffold/${sample}/agp_fasta/EXP_REFINEFINAL1_bppAdjust_cmap_p_ctg_Individual2_arrow_fasta_NGScontigs_HYBRID_SCAFFOLD_NCBI.fasta \
    /path/to/hybridscaffold/${sample}/agp_fasta/EXP_REFINEFINAL1_bppAdjust_cmap_p_ctg_Individual2_arrow_fasta_NGScontigs_HYBRID_SCAFFOLD_NOT_SCAFFOLDED.fasta \
  > ${sample}-arrow.scaffold.fa

perl ~/tools/countFasta.pl ${sample}-arrow.scaffold.fa > ${sample}-arrow.scaffold.fa.stats

cat ${sample}-arrow.scaffold.fa | sed -e 's/|/_/g' -e 's/:/_/g' > ${sample}-arrow.scaffold.rename.fa

samtools faidx ${sample}-arrow.scaffold.rename.fa

cat ${sample}-arrow.scaffold.rename.fa | awk '/^>/{name=substr($1,2,length($1))}{print > "./eachscfs/"name".fa"}'
