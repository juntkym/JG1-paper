#!/bin/sh

set -eux

qsub split.and.index.sh

qsub pilon.sh

qsub mergefasta.sh
