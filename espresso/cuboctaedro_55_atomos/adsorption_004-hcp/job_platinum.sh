#!/bin/bash
#SBATCH -n 16
#SBATCH --ntasks-per-node=16
#SBATCH -p batch-AMD
#SBATCH --mem=64000mb
#SBATCH -w work3

module load quantum-espresso/v7.3.1-intel

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

mpirun -n 16 pw.x < espresso.pwi > espresso.pwo

