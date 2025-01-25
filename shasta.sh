#!/bin/bash

#SBATCH --time=36:00:00
#SBATCH -c 16
#SBATCH --mem 100G

########################################################
# de novo long read assembler, optimised for ONT
# version 0.11.1
## https://github.com/paoloshasta/shasta?tab=readme-ov-file
#######################################################

# set up

## Add wtdbg2 to path
export PATH=$PATH:~/sharedscratch/apps/

## set file paths and variable names
export input="../186-T3S2.unclassified_kraken_out.fq"
export prefix="186-T3S2_kraken_shasta"

# Run an assembly.
shasta-Linux-0.11.1 --input $input --config Nanopore-R10-Fast-Nov2022 --threads 16

## OPTIONS
### --config for options run shasta-Linux-0.11.1 --command listConfigurations
### these are explained at https://paoloshasta.github.io/shasta/Configurations.html
### R10 flow cell, haploid assembly, slow mode is depreciated :. I chose fast
