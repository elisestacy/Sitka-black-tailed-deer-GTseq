#!/bin/bash
#SBATCH -J align_trimmed_SBTD_gtseq_data
#SBATCH --cpus-per-task=12

# Script to align your reads to a reference genome with bwa mem 
# and sort the resulting .bam files with samtools

# Load required modules
module load bwa
module load samtools

# Declare variables and paths
sample_names_path=/path/to/dir/Tissue_samples/sample_names.tsv
reads_path=/path/to/dir/Tissue_samples/02_trim
database_path=/path/to/dir/Reference_genome/database/SBTD
out_path=/path/to/dir/Tissue_samples/03_align

# Run command as a while loop to go through sample list 
cat $sample_names_path | cut -f 2 |
while read sample; do
	echo "bwa mem -t 2 $database_path $reads_path/${sample}.fq | \
		samtools view -b -h | samtools sort --threads 2 -o $out_path/${sample}.bam";
done | parallel -j 4
