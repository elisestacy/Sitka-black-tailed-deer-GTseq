#!/bin/bash
#SBATCH -J SBTD_populations
#SBATCH --cpus-per-task=4

# Load required modules
module load stacks/2.60

# Declare paths and variables
thr=4
popmap=/path/to/dir/Tissue_samples/SBTD_popmap.tsv
gstacks_out=/path/to/dir/Tissue_samples/04_genotype/gstacks/%m%d%y_gstacks_SBTD #update to gstacks folder
populations_out_path=/path/to/dir/Tissue_samples/05_filter/populations

# Create an output directory for this specific populations run
populations_output=$populations_out_path/populations_reps_R0.5_mac2
mkdir -p $populations_output

# Set filter parameters
R=0.5   # minimum precentage of individuals required to process a locus
#r=0.5   # min percentage of individuals required to process a locus per population
#maf=0.05  # minor allele frequence of X% required to process a site at a locus
mac=2 # minor allele count

cmd=(
	populations
	--in-path $gstacks_out
	--out-path $populations_output
	--popmap $popmap
	--threads $thr
	--min-samples-overall $R
#   --min-samples-per-pop $r
#	--min-maf $maf
	--min-mac $mac
#	--hwe
	--ordered-export
	--vcf
)
"${cmd[@]}"