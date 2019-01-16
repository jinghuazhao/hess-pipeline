#!/bin/bash
# 16-1-2019 JHZ

. /etc/profile.d/modules.sh
module load python/2.7.10

export trait=$1
export HESS=/scratch/jhz22/hess
export HESS_pipeline=/scratch/jhz22/hess-pipeline
export wd=$(pwd)/$(basename $trait).tmp

echo $wd

if [ ! -d $wd ]; then
   mkdir -p $wd
fi
cd $wd

# Step 1 - setup/eigenvalues and projections

parallel -j11 --env HESS_pipeline \
              --env HESS \
              --env trait \
              --env wd \
              'python $HESS/hess.py \
                     --local-hsqg $trait \
                     --chrom $chr \
                     --bfile $HESS/1kg_eur_1pct/1kg_eur_1pct_chr{} \
                     --partition-file $HESS/nygcresearch-ldetect-data-ac125e47bf7f/EUR/fourier_ls-chr{}.bed \
                     --out $trait' ::: $(seq 22)

# Step 2 - compute local SNP heritability
  
python $HESS/hess.py --prefix $trait --k 50 --out $trait.h2g
