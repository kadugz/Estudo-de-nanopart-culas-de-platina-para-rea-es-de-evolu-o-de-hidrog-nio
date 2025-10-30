#!/bin/bash
#SBATCH -n 36
#SBATCH --ntasks-per-node=36
#SBATCH -p intel
#SBATCH --mem=185G

module purge
source /home/james/Packages/intel/oneapi/setvars.sh

mpirun -n 36 /home/james/Packages/qe-7.3.1/bin/pw.x -inp espresso.pwi > espresso.pwo
