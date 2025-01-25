#!/bin/bash

#SBATCH -t 36:00:00
#SBATCH -c 16
#SBATCH --mem 96G
##SBATCH --mail-type=ALL
##SBATCH --mail-user=m.scott2.21@abdn.ac.uk

#05/12/22 worked for J15J29_ACAGTG best k is 45 I think

#~/sharedscratch/apps/platanus assemble -o ./output \
#	-f J15J29_ACAGTG_L001_R1_001.fastq  J15J29_ACAGTG_L001_R2_001.fastq \
#	-k 20 -s 5 -u 0.2 \
#	-tmp ./temp -m 96 -t 16 

#assebly of GTGAAA with platanus 06/12/22
#~/sharedscratch/apps/platanus assemble -o ./J15J29_GTGAAA \
#       -f J15J29_GTGAAA_L001_R1_001.fastq  J15J29_GTGAAA_L001_R2_001.fastq \
#       -k 20 -s 5 -u 0.2 \
#       -tmp ./temp -m 96 -t 16

#try and make a combined contigs file 07/12/22

#~/sharedscratch/apps/platanus assemble -o ./J15J29_combined \
#       -f J15J29_*_L001_R1_001.fastq  J15J29_*_L001_R2_001.fastq \
#       -k 20 -s 5 -u 0.2 \
#       -tmp ./temp -m 96 -t 16


#attempt to scaffold ACAGTG

~/sharedscratch/apps/platanus scaffold -o J15J29_ACAGTG \
	-c J15J29_ACAGTG_contig.fa \
	-b J15J29_ACAGTG_contigBubble.fa \
	-IP1 J15J29_ACAGTG_L001_R1_001.fastq J15J29_ACAGTG_L001_R2_001.fastq \
	-u 0.2 \
	-t 16 -tmp temp
#no mate pairs, insert size of 0 for paired end reads? so no -a -n or -d


#Usage: platanus scaffold [Options]
#Options:
#    -o STR                             : prefix of output file (default out, length <= 200)
#    -c FILE1 [FILE2 ...]               : contig_file (fasta format)
#    -b FILE1 [FILE2 ...]               : bubble_seq_file (fasta format)
#    -ip{INT} PAIR1 [PAIR2 ...]         : lib_id inward_pair_file (reads in 1 file, fasta or fastq)
#    -IP{INT} FWD1 REV1 [FWD2 REV2 ...] : lib_id inward_pair_files (reads in 2 files, fasta or fastq)
#    -op{INT} PAIR1 [PAIR2 ...]         : lib_id outward_pair_file (reads in 1 file, fasta or fastq)
#    -OP{INT} FWD1 REV1 [FWD2 REV2 ...] : lib_id outward_pair_files (reads in 2 files, fasta or fastq)
#    -n{INT} INT                        : lib_id minimum_insert_size
#    -a{INT} INT                        : lib_id average_insert_size
#    -d{INT} INT                        : lib_id SD_insert_size
#    -e FLOAT                           : coverage depth of homozygous region (default auto)
#    -s INT                             : mapping seed length (default 32)
#    -v INT                             : minimum overlap length (default 32)
#    -l INT                             : minimum number of link (default 3)
#    -u FLOAT                           : maximum difference for bubble crush (identity, default 0.1)
#    -t INT                             : number of threads (<= 1, default 1)
#    -tmp DIR                           : directory for temporary files (default .)

