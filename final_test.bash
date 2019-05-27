#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=512GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

cd /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/test_final

## install program
wget https://github.com/OSU-BMBL/metaqubic/archive/master.zip
cd ./metaqubic-master
sh setup.sh
cd ..


## download data
wget http://bmbl.sdstate.edu/metaqubic/meta_data.gz
tar -xvzf meta_data.gz && rm -rf meta_data.gz



./metaqubic-master/runmeta --mapping -s ./meta_data/data/samples/ -ref ./meta_data/data/ref/IGC_ref.fa -o1 ./meta_data/results/align_out/ -o2 ./meta_data/results/cat/

./metaqubic-master/runmeta --CatToMat -i ./meta_data/results/cat/ -m ./meta_data/data/735_hGEM/ -o ./meta_data/results/hGEM/

./metaqubic-master/runmeta --filtering -i ./meta_data/data/ref/IGC_ref.fa -m ./meta_data/results/hGEM/ -minTPM 1 -NominTPM 2 -o ./meta_data/results/hGEM_filt/

./metaqubic-master/runmeta --biclustering -i ./meta_data/results/hGEM_filt/RDRPK_hGEM_filt.txt -o ./meta_data/results/bic/ --QUBIC -f 0.8 -o 200 

./metaqubic-master/runmeta --enrichment -i ./meta_data/results/bic/RDRPK_hGEM_filt.txt.blocks -g ./meta_data/data/annotation/KEGG_annotation.txt -o ./meta_data/results/enrich_out/
