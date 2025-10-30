#!/bin/bash
#SBATCH -n 1
#SBATCH --ntasks-per-node=1
#SBATCH -p batch-AMD

module load FDMNES

ulimit -s unlimited

mpirun --version
echo "#############"
echo "##LIBRARIES##"
echo "#############"
echo $LD_LIBRARY_PATH
echo "#############"
echo "#EXECUTABLE##"
echo "#############"
which mpirun_fdmnes || which mpirun || which fdmnes
echo "#############"
echo "###WRK DIR###"
echo "#############"
pwd

cat /proc/cpuinfo || true
cat /proc/meminfo || true

export HOST_NUM_FOR_MUMPS=4

echo "Starting nested loops for GAMMAMAX, ECENT, and ELARGE variations."
echo "----------------------------------------------------"

# Outer loop for GAMMAMAX (1..20)
for (( i_gamma=6; i_gamma<=6; i_gamma++ ))
do
    GAMMAMAX_VAL="${i_gamma}.0"

    # Middle loop for ECENT (10..40 step 2)
    for (( i_ecent=34; i_ecent<=34; i_ecent+=1 ))
    do
        ECENT_VAL="${i_ecent}.0"

        # Inner loop for ELARGE (10..40 step 2)
        for (( i_elarge=30; i_elarge<=30; i_elarge+=1 ))
        do
            ELARGE_VAL="${i_elarge}.0"

            echo "Processing: GAMMAMAX=${GAMMAMAX_VAL}, ECENT=${ECENT_VAL}, ELARGE=${ELARGE_VAL}"
            echo "----------------------------------------------------"

            # 1) Gerar input usando change-convolution.bash (assume-se no mesmo diretório)
            bash change-convolution.bash "$GAMMAMAX_VAL" "$ECENT_VAL" "$ELARGE_VAL"
            if [ $? -ne 0 ]; then
                echo "Error: 'change-convolution.bash' failed for G=${GAMMAMAX_VAL}, E=${ECENT_VAL}, L=${ELARGE_VAL}. Skipping."
                continue
            fi
            echo "Input file 'fdmnes-restart.in' created."

            # 2) Preparar nome do arquivo de log de stdout/stderr para esta combinação
            #    (troque '.' por 'p' se achar melhor para evitar pontos em nomes)
            SAFE_G=$(echo "${GAMMAMAX_VAL}" | sed 's/\./p/g')
            SAFE_E=$(echo "${ECENT_VAL}"     | sed 's/\./p/g')
            SAFE_L=$(echo "${ELARGE_VAL}"   | sed 's/\./p/g')
            OUTFILE="fdmnes_G${SAFE_G}_E${SAFE_E}_L${SAFE_L}.out"

            # 3) Executar FDMNES: preferir mpirun_fdmnes se existir, senão mpirun, senão fdmnes direto.
            mpirun_fdmnes -n 32 < fdmnes-restart.in > "${OUTFILE}" 2>&1

            if [ ${RC} -ne 0 ]; then
                echo "Warning: fdmnes returned non-zero exit code (${RC}) for G=${GAMMAMAX_VAL}, E=${ECENT_VAL}, L=${ELARGE_VAL}."
                # continua para próximos casos em vez de abortar
            fi

            # 4) Renomear/organizar saídas geradas pelo FDMNES (se existirem)
            GAMMAMAX_INT=$(printf %.0f "${GAMMAMAX_VAL}")
            ORIGINAL_OUTPUT_NAME="fdmnes-restart.out_Gm${GAMMAMAX_INT}_conv.txt"
            NEW_OUTPUT_NAME="fdmnes-restart.out_Gm${GAMMAMAX_VAL}_${ECENT_VAL}_${ELARGE_VAL}_conv.txt"

            if [ -f "${ORIGINAL_OUTPUT_NAME}" ]; then
                echo "Renaming '${ORIGINAL_OUTPUT_NAME}' -> '${NEW_OUTPUT_NAME}'"
                mv "${ORIGINAL_OUTPUT_NAME}" "${NEW_OUTPUT_NAME}"
            else
                echo "Aviso: arquivo padrão '${ORIGINAL_OUTPUT_NAME}' não encontrado (talvez FDMNES tenha outro padrão de saída)."
            fi

            # 5) Garantir que o log stdout também seja salvo com nome descritivo (já é OUTFILE)
            echo "Stdout saved to: ${OUTFILE}"
            echo "----------------------------------------------------"
        done
    done
done

echo "All simulations completed."
echo "----------------------------------------------------"
