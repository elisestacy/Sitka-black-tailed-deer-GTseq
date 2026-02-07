#!/bin/bash
#SBATCH -J SBTD_gstacks
#SBATCH --cpus-per-task=8

# Script for genotyping using gstacks

# Load required modules
module load stacks/2.60

# Declare paths and variables
work_dir=/path/to/dir/Tissue_samples/04_genotype/gstacks
out=$(date +${work_dir}/%m%d%y_gstacks_SBTD) #to create an output directory with the date
mkdir -p $out
popmap=/path/to/dir/Tissue_samples/SBTD_popmap.tsv
aligned_samples=/path/to/dir/Tissue_samples/03_align
threads=8

gstacks \
        -I $aligned_samples \
        -O $out \
        -M $popmap \
        -t $threads \
        --details
