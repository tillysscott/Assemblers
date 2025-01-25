#!/bin/bash

#SBATCH --time=36:00:00
#SBATCH -c 5
#SBATCH --mem 100G

#####################################################################################
#use ntLink to scaffold the PacBio assembly using the Hgigas krakened MinION reads (multiple individuals)
# GitHub: https://github.com/bcgsc/ntLink
# Refs: Coombe L, Warren RL, Wong J, Nikolic V and Birol I. ntLink: A toolkit for de novo 
## genome assembly scaffolding and mapping using long reads. Current Protocols 3, e733 (2023). https://doi.org/10.1002/cpz1.733


####
#Set Up
## Source miniconda3 installation and activate environment
source /opt/software/uoa/apps/miniconda3/latest/etc/profile.d/conda.sh
conda activate ntlink

## set up variable names and paths
export genome="Hirondellea_PacBio-pdrnd1.fa"
### reads need to be in the same directory as the contigs
#export reads="Hgigas_ONT.unclassified_kraken_out.fq"
export reads="Hgigas_ONT.unclassified_kraken_out.clean.gxsplit_clean.fa"
export prefix="ntLink_k24_w75_a1_rounds_gx_path"
export namey="k24.w75"

echo $prefix

#####
#Run
#ntLink scaffold target=$genome reads=$reads t=5 prefix=$prefix overlap=True k=24 w=100 a=3
ntLink_rounds run_rounds target=$genome reads=$reads t=5 overlap=True k=24 w=75 a=1 rounds=3 

####
#Tidy
mkdir $prefix
mv Hirondellea_PacBio-pdrnd1.fa.* $prefix

####
# IMPORTANT
### move final scaffold to PacBio folder
#cp ntLink_k24_w75_a1_rounds_gx_path/Hirondellea_PacBio-pdrnd1.fa.k24.w75.z1000.ntLink.fa.k24.w75.z1000.ntLink.scaffolds.fa \
# ../Hirondellea_PacBio-pdrnd1.ntLink_scaffolds.fa

#AGP POSITIONING FILES FOR ROUND 2, K24, W 75, A 1 ARE:
#Test_2/PacBio/scaffolding/ntLink_k24_w75_a1_rounds_gx_path/Hirondellea_PacBio-pdrnd1.fa.k24.w75.z1000.ntLink.ntLink.fa.agp
#& Test_2/PacBio/scaffolding/ntLink_k24_w75_a1_rounds_gx_path/Hirondellea_PacBio-pdrnd1.fa.k24.w75.z1000.ntLink.fa.agp



####
# Assembly stats
#conda deactivate
#conda activate gaas

#stats.sh in=$prefix/Hirondellea_PacBio-pdrnd1.fa.$namey.z1000.ntLink.scaffolds.fa

####
# When finished move files back to home
#mv Hirondellea_PacBio-pdrnd1.fa ~/sharedscratch/Test_2/DarenAnalysis/WG_Hirondellea/
#mv Hgigas_ONT.unclassified_kraken_out.fq ~/sharedscratch/Test_2/MinION/Hgigas/
