# hess-pipeline

The scripts here are developed to facilitate heritability estimation from summary statistics (HESS) as available from https://github.com/huwenboshi/hess.

They were initially tested using EPIC-Norfolk GWAS, for which [`test.sh`](test/test.sh), [`test.subs`](test/test.subs) and [`test.awk`](test/test.awk) are created to work on `/genetics/bin/hess/tests` directory and later on changed to /genetics/data/gwas/8-7-15/QUS.

Further work was done to make it generic with GIANT data on height meta-analysis. These only involve SNP ids the as sorting key.

To set it up, modify `hess.sh` as appropriate for your system.

The syntax is as follows,

hess.sh `GWAS-summary-statistics`

where `GWAS-summary-statistics` has these columns: rsID, pos, A1, A2, Z, N.

Recently there has been considerable changes, documented in https://huwenboshi.github.io/hess/, we have [height.sh](height/height.sh) to reflect this whereas ealier version is available from the release as well as the [oldrelease](oldrelease) directory.

NOTE finally that HESS describes bed file as with UCSC (https://genome.ucsc.edu/).
