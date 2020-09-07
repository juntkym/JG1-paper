#!/bin/bash

# jg1a-based assemblies
cat 070_vcf_headers/Rjg1a.jg1b-jg1c.Qjg1a.cslong.vcf.header \
    142_to_be_replaced_vcf/Rjg1a.jg1b-jg1c.tobereplaced.major.tri.noheader.vcf \
    > ./152_to_be_replaced_vcf_with_header/Rjg1a.jg1b-jg1c.tobereplaced.major.tri.header.vcf

cat 070_vcf_headers/Rjg1a.jg1c-jg1b.Qjg1a.cslong.vcf.header \
    142_to_be_replaced_vcf/Rjg1a.jg1c-jg1b.tobereplaced.major.tri.noheader.vcf \
    > ./152_to_be_replaced_vcf_with_header/Rjg1a.jg1c-jg1b.tobereplaced.major.tri.header.vcf

cat 070_vcf_headers/Rjg1a-jg1b.jg1c.Qjg1a.cslong.vcf.header \
    142_to_be_replaced_vcf/Rjg1a-jg1b.jg1c.tobereplaced.major.tri.noheader.vcf \
    > ./152_to_be_replaced_vcf_with_header/Rjg1a-jg1b.jg1c.tobereplaced.major.tri.header.vcf

cat 070_vcf_headers/Rjg1a-jg1c.jg1b.Qjg1a.cslong.vcf.header \
    142_to_be_replaced_vcf/Rjg1a-jg1c.jg1b.tobereplaced.major.tri.noheader.vcf \
    > ./152_to_be_replaced_vcf_with_header/Rjg1a-jg1c.jg1b.tobereplaced.major.tri.header.vcf

# repeat for jg1b-based assemblies

# repeat for jg1c-based assemblies
