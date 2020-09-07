#!/bin/bash

set -eux

qsub preparefa.sh
qsub mkindex_pilon.sh

qsub bwamem162.sh
qsub bwamem259.sh

qsub markdup162.sh
qsub markdup259.sh

qsub mergebam.sh
qsub mergeindex.sh
