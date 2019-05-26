#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=512GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

## get to the directory
cd /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/test3



## biclustering OK
./metaqubic-master/runmeta --biclustering -i ./meta_data/results/hGEM_filt/RDRPK_hGEM_filt.txt -o ./meta_data/results/bic/ --QUBIC -f 0.8 -o 200 

## enrichment OK
./metaqubic-master/runmeta --enrichment -i ./meta_data/results/bic/RDRPK_hGEM_filt.txt.blocks -g ./meta_data/data/annotation/kegg_annotation.txt -o ./meta_data/results/enrich_out/
