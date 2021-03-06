#!/bin/bash
# 16-1-2019 JHZ

. /etc/profile.d/modules.sh
module load python/2.7.10

export trait=$1
export HESS=/scratch/jhz22/hess
export pwd=${PWD}
export wd=$(pwd)/$(basename $trait).tmp

echo $wd

if [ ! -d $wd ]; then
   mkdir -p $wd
fi
cd $wd
ln -fs ${pwd}/$trait

# Step 1 - estimate eigenvalues and projections

parallel -j5 --env HESS --env trait 'python $HESS/hess.py \
        --local-hsqg $trait \
        --chrom {} \
        --bfile $HESS/1kg_eur_1pct/1kg_eur_1pct_chr{} \
        --partition $HESS/nygcresearch-ldetect-data-ac125e47bf7f/EUR/fourier_ls-chr{}.bed \
        --out $trait' ::: $(seq 22)

# Step 2 - compute local SNP heritability
  
python $HESS/hess.py --prefix $trait --out $trait.h2g

# Step x -- perform additional analyses

cd -
