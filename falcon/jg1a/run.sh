#!/bin/bash

source /path/to/fc_env_171204/bin/activate

set -eux

cd $(dirname $0)
fc_run fc_run_180214.cfg 2>&1 | tee $(basename $0).log.$(date +%s)

