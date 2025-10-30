#!/bin/bash
#SBATCH -n 36
#SBATCH --ntasks-per-node=36
#SBATCH -p intel

module purge
#source /home/james/Packages/intel/oneapi/setvars.sh
export LD_LIBRARY_PATH=~/local/lib:$LD_LIBRARY_PATH

/home/james/Packages/parallel_fdmnes/mpirun_fdmnes -np 36
