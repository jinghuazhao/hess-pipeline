# hess-pipeline

The scripts here are developed to facilitate heritability estimation from summary statistics (HESS) as available from https://github.com/huwenboshi/hess.

The scripts were initially tested using EPIC-Norfolk GWAS, for which [`test.sh`](test/test.sh), [`test.subs`](test/test.subs) and [`test.awk`](test/test.awk) are created to work on `/genetics/bin/hess/tests` directory and later on changed to /genetics/data/gwas/8-7-15/QUS.

Further work is done to make it generic including examples for height and QUS meta-analyses. These only involve SNP ids the as sorting key. The scripts are `hess.sh`, `hess.subs` and `hess.awk`.

To set it up, modify file locations in hess.sh as appropriate for your system.

The syntax is as follows,

hess.sh `GWAS-summary-statistics`

where `GWAS-summary-statistics` has these columns: rsID, pos, A1, A2, Z, N.

Recently there has been considerable changes as decribed in software-notes repository, we have [height.sh](height/height.sh) to reflect this whereas ealier version is available from the release.

NOTE finally that HESS describes bed file as with UCSC (https://genome.ucsc.edu/).
