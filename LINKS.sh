#!/bin/bash

#SBATCH --time=36:00:00
#SBATCH -c 4
#SBATCH --mem 200G
#SBATCH --partition=uoa-compute

#####################################################################################
#use LINKS to scaffold the PacBio assembly using the Hgigas krakened MinION reads (multiple individuals)
#GitHub: https://github.com/bcgsc/LINKS
#Ref : LINKS: Scalable, alignment-free scaffolding of draft genomes with long reads. Warren RL, Yang C, 
## Vandervalk BP, Behsaz B, Lagman A, Jones SJ, Birol I. Gigascience. 2015 Aug 4;4:35. doi: 10.1186/s13742-015-0076-3. eCollection 2015.

####
#Set Up
## Source miniconda3 installation and activate environment
source /opt/software/uoa/apps/miniconda3/latest/etc/profile.d/conda.sh
conda activate links 

## set up variable names and paths
export genome="Hirondellea_PacBio-pdrnd1.fa"
### reads need to be in the same directory as the contigs
export reads="reads_list.txt"
export prefix="LINKS_1"

#####
#Run

LINKS -f $genome -s $reads -j 4 -b $prefix

####
# When finished move files back to home
#mv Hirondellea_PacBio-pdrnd1.fa ~/sharedscratch/Test_2/DarenAnalysis/WG_Hirondellea/
#mv Hgigas_ONT.unclassified_kraken_out.fq ~/sharedscratch/Test_2/MinION/Hgigas/
