#!/bin/bash
# 27-2-2017 MRC-Epid JHZ

awk '{
  FS=OFS="\t";
  t=NR
  if(NR==1) t="Pos"
  if(NR==1) print "SNP","pos","A1","A2","Z", "N"
  else print $1,t,$2,$3,$5/$6,$8
}' /genetics/data/twas/14-10-16/GIANT/GIANT_HEIGHT_Wood_et_al_2014_publicrelease_HapMapCeuFreq.txt \
   | sort -k1,1 > height

/genetics/bin/hess/hess.sh height

rm height
