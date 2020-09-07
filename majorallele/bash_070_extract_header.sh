#!/bin/bash

cat vcf/Rjg1a.jg1b-jg1c.Qjg1a.cslong.vcf  | grep ^# > ./vcf_headers/Rjg1a.jg1b-jg1c.Qjg1a.cslong.vcf.header
cat vcf/Rjg1a.jg1b-jg1c.Qjg1b.cslong.vcf  | grep ^# > ./vcf_headers/Rjg1a.jg1b-jg1c.Qjg1b.cslong.vcf.header
# ...omit 33 lines...
cat vcf/Rjg1c-jg1b.jg1a.Qjg1c.cslong.vcf  | grep ^# > ./vcf_headers/Rjg1c-jg1b.jg1a.Qjg1c.cslong.vcf.header
