#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH -c 2
#SBATCH --mem 48G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=m.scott2.21@abdn.ac.uk

#16/11/22
#rainbow script for assembling RADseq data, when don't care too much about heterozygosity and SNPs

#16/01/23

#get list of all numbers
#ls *.rem.1.fq.gz > numfile.txt
#vim numfile.txt, :%s/.rem.1.fq.gz//g, :w num.txt
#vim num.txt, mannually remove any files we arent interested in,:w editednum.txt 
	#see page 3 and 38 of grey notebook
#move rem files to rem folder in clean

#concatenate all wanted forward and reverse reads
#the correct way is with a loop 01.02.23
#rm Hirondellea_[12].fq.gz
#for ind in $(cat editednum.txt)
#do
#        cat $ind.1.fq.gz >> Hirondellea_1.fq.gz
#        cat $ind.2.fq.gz >> Hirondellea_2.fq.gz
#done

#add to path manually before doing anything else
#PATH=$PATH:~/sharedscratch/apps/rainbow-2.0.4

#rainbow cluster -1 Hirondellea_1.fq  -2 Hirondellea_2.fq > rbcluster.out 2> log
#rainbow div -i rbcluster.out -o rbdiv.out
#rainbow merge -i rbdiv.out -o rbasm.out -a -N500

#I copied the rbasm.out into the apps/rainbow folder and ran the next command from there, but you might not need to

#module load perl
#perl select_best_rbcontig.pl rbasm.out > Abyssorchomene_rb.fa

