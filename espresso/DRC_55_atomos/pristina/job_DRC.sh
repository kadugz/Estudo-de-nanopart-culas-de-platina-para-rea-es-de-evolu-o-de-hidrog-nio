#!/bin/bash
#SBATCH -n 16
#SBATCH --ntasks-per-node=16
#SBATCH -p batch-AMD
#SBATCH --mem=64000mb

module load quantum-espresso/7.3.1-gnu-netlib

ulimit -s unlimited

mpirun --version
echo "#############"
echo "##LIBRARIES##"
echo "#############"
echo $LD_LIBRARY_PATH
echo "#############"
echo "#EXECUTABLE##"
echo "#############"
which pw.x
echo "#############"
echo "###WRK DIR###"
echo "#############"
pwd

# Executa o QE
mpirun -n 16 pw.x < espresso.pwi > espresso.pwo
