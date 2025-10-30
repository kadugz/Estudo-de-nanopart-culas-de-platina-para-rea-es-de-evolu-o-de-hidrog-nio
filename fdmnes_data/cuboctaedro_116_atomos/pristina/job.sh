#!/bin/bash
#SBATCH -n 32
#SBATCH --ntasks-per-node=32
#SBATCH -p batch-AMD
#SBATCH --mem=128G

module load FDMNES

ulimit -s unlimited

hostname

mpirun --version
echo "#############"
echo "##LIBRARIES##"
echo "#############"
echo $LD_LIBRARY_PATH
echo "#############"
echo "#EXECUTABLE##"
echo "#############"
which mpirun_fdmnes
echo "#############"
echo "###WRK DIR###"
echo "#############"
pwd

export HOST_NUM_FOR_MUMPS=4 
mpirun_fdmnes -np 32

