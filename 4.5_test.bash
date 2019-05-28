#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=512GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

cd /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/test_final_2

./metaqubic-master/runmeta --bicToSeq -i ./meta_data/results/enrich_out/enriched.blocks -s. Sample001 -o ./meta_data/results/HUManN2
