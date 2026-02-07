#!/bin/bash
#SBATCH -p eight
#SBATCH -J SBTD_demultiplexing
#SBATCH --cpus-per-task=10

# Load required modules
module load python

# Set variables and paths
work_dir=/path/to/dir/
barcodes=$work_dir/Tissue_samples/SBTD_Sample_Barcodes.csv
fastq=$work_dir/Tissue_samples/00_raw/raw.fastq.gz
out_dir=$work_dir/Tissue_samples/01_demultiplex

# Go to the script directory
cd $work_dir/scripts

# Run the demultiplexing script
./GTseq_BarcodeSplit_KML.py $barcodes $fastq $out_dir