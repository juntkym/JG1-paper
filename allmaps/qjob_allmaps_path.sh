#!/bin/sh
#$ -S /bin/bash
#$ -cwd

#$ -pe def_slot 16
#$ -l lmem

source /path/to/venv2715-allmaps/bin/activate

PARAMS=(
[1]="allmaps/default-bed/GeneMap99-G3-gPCR-default.mod.bed"
[2]="allmaps/default-bed/GeneMap99-GB4-gPCR-default.mod.bed"
[3]="allmaps/default-bed/Genethon-gPCR-default.bed"
[4]="allmaps/default-bed/Marshfield-gPCR-default.bed"
[5]="allmaps/default-bed/NCBI-RH-gPCR-default.mod.bed"
[6]="allmaps/default-bed/NHGRI-7-gPCR-default.bed"
[7]="allmaps/default-bed/Stanford-G3-gPCR-default.mod.bed"
[8]="allmaps/default-bed/TNG-gPCR-default.mod.bed"
[9]="allmaps/default-bed/Whitehead-RH-gPCR-default.mod.bed"
[10]="allmaps/default-bed/Whitehead-YAC-gPCR-default.bed"
[11]="allmaps/default-bed/deCODE-gPCR-default.bed"
)


python -m jcvi.assembly.allmaps path\
     G3RH6.bed \
     --gapsize=10000\
     /path/to/allmaps/jg1c.jg1a-jg1b-arrow.draft.norm.cns.fa

mkdir pdf
mkdir png

ls *.pdf | awk '{print "convert", $1, substr($1,1,length($1)-4)".png"}' | bash

mv *.pdf pdf
mv *.png png
