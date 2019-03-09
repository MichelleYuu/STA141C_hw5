#!/bin/bash -l


# Use the staclass partition. Only applies if you are in STA141C


# Use two cores to get some pipeline parallelism
#SBATCH --cpus-per-task=2

# Give the job a name
#SBATCH --job-name=hw5

# #SBATCH --mail-type=END
# #SBATCH --mail-user=

#Load R module:
module load R/3.4.4

#Use the staclass partiton. Only applies if you are in STA141C
#SBATCH --partition=staclass



srun bash q6.sh
