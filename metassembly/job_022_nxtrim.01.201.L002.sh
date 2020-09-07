#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -pe def_slot 2

LD_LIBRARY_PATH=/path/to/lib64:$LD_LIBRARY_PATH \

/path/to/bin/nxtrim-0.4.3/nxtrim \
	-1 /path/to/${sample}_L002_R1_001.fastq.gz \
	-2 /path/to/${sample}_L002_R2_001.fastq.gz \
	--separate \
	-O ${sample}_nxtrim
