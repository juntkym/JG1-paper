#!/bin/bash

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.GeneMap99-G3.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.GeneMap99-G3.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.GeneMap99-GB4.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.GeneMap99-GB4.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.Genethon.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.Genethon.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.NCBI_RH.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.NCBI_RH.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.NHGRI-7.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.NHGRI-7.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.Marshfield.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.Marshfield.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.TNG.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.TNG.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.WUSTL-X.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.WUSTL-X.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.Whitehead-RH.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.Whitehead-RH.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.Whitehead-YAC.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.Whitehead-YAC.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.Stanford-G3.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.Stanford-G3.chr.chrpos.scf.scfpos.table

cat gPCR-results/jg1c.jg1a-jg1b-arrow.draft.norm.cns.deCODE.gPCR.results \
| awk '{split($2,col2,"."); split($3,col3,"::"); printf "%s %3.2f %s %d\n", col3[4],col3[5],$1,(col2[1] + col2[3])/2}' \
| sort --version-sort \
> jg1c.jg1a-jg1b-arrow.draft.norm.cns.deCODE.chr.chrpos.scf.scfpos.table
