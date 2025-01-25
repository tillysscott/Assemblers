#!/bin/bash

#SBATCH --time=36:00:00
#SBATCH -c 10
#SBATCH --mem 100G

########################################################
# polish consensus with racon
# version 1.4.3
#######################################################

# set up

## Load racon and minimsp2
module load minimap2/2.24
#module load samtools
module load racon/1.4.3

## set file paths and variable names
export input="all_Bathy.unclassified_kraken_out.fq"
export prefix="all-Bathy_kraken_redbean_p19"
export indir="S1_A_e2_r_R_L1024_K2000_ad-1_l500_k0_p19"
export outdir="racon"

## make output directory
#rm -r -d $outdir
#mkdir $outdir

# polish consensus, not necessary if you want to polish the assemblies using other tools
## round 1
minimap2 -t10 -ax map-ont -r2k $indir/$prefix.ctg.fa $input > $outdir/$prefix.polish1.sam
 racon -t 10 $input $outdir/$prefix.polish1.sam $indir/$prefix.ctg.fa > $outdir/$prefix.racon1.fa

## round 2
minimap2 -t10 -ax map-ont -r2k $outdir/$prefix.racon1.fa $input > $outdir/$prefix.polish2.sam
racon -t 10 $input $outdir/$prefix.polish2.sam $outdir/$prefix.racon1.fa > $outdir/$prefix.racon2.fa

## round 3
minimap2 -t10 -ax map-ont -r2k $outdir/$prefix.racon2.fa $input > $outdir/$prefix.polish3.sam
racon -t 10 $input $outdir/$prefix.polish3.sam $outdir/$prefix.racon2.fa > $outdir/$prefix.racon3.fa

## round 4
minimap2 -t10 -ax map-ont -r2k $outdir/$prefix.racon3.fa $input > $outdir/$prefix.polish4.sam
racon -t 10 $input $outdir/$prefix.polish4.sam $outdir/$prefix.racon3.fa > $outdir/$prefix.racon4.fa

## round 2
minimap2 -t10 -ax map-ont -r2k $outdir/$prefix.racon4.fa $input > $outdir/$prefix.polish5.sam
racon -t 10 $input $outdir/$prefix.polish5.sam $outdir/$prefix.racon4.fa > $outdir/$prefix.racon5.fa
