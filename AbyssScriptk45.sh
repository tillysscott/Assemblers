#!/bin/bash

#SBATCH -t 36:00:00
#SBATCH -c 16
#SBATCH --mem 96G


#abyss assembly script from fastq files
#remeber to conda activate abyss-env

abyss-pe name=J15J29_ACAGTG n=5 k=45 B=6G in='J15J29_ACAGTG_L001_R1_001.fastq J15J29_ACAGTG_L001_R2_001.fastq'

