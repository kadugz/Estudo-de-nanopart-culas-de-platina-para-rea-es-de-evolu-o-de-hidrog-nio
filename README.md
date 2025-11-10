# Iniciação Científica FAPESP — Simulações DFT e XANES

**Bolsista:** Carlos Eduardo Santos

**Orientador:** Prof. James Moraes de Almeida (ILUM/CNPEM)

**Período de vigência:** 01/11/2024 a 31/10/2025

Este repositório reúne os arquivos relevantes, dados e scripts utilizados durante a Iniciação Científica financiada pela FAPESP de processo: 2024/17010-3 vinculado a: 2023/09820-2. O projeto envolve o uso de métodos de **Teoria do Funcional da Densidade (DFT)** e simulações **XANES** para o estudo de propriedades eletrônicas e estruturais de sistemas metálicos com potencial aplicação catalítica. A maioria desses códigos geram centenas de arquivos por pasta, mas apenas os arquivos utilizados de output foram adicionados para facilitar a reprodutibilidade do projeto.

## Estrutura do Repositório

* `espresso/` — arquivos de entrada e saída das simulações, do software Quantum ESPRESSO, para obter as energias dos três modelos de partícula - cuboctaédricas de 55 átomos, e 116 átomos, bem como Distorced Reduced Core de 55 átomos (DRC). Esses dados, futuramente, foram usadas no cálculo dos $\Delta G$.
* `fdmnes_data/` — arquivos de entrada e saída das simulações, do software FDMNES, para obter as curvas de abosrção de raios-X próximos a borda (XANES) de cada sítio. Como os dados da DRC foram mais distantes em $\Delta G$ que as cuboctaédricas, segue-se com os XANES das partículas cuboctaédricas e da platina "bulk", simulado para a comparação da variação de espectros $\Delta \mu$.
* `convolution/` — arquivos de entrada e saída utilizados nas convoluções das curvas de XANES teóricos com base nas convoluções do fdmnes. As pastas GAMMAMAX, ECENT e ELARGE contém a variação de cada um desses três parâmetros nas simulações ($\Gamma_{max}$, $E_{cent}$ e $E_{larg}$). As pastas 55atm e 116atm contém as convoluções realizadas dos dados de XANES dessas partículas
* `python_codes/` — arquivos contendo cadernos `.ipynb` que realizam na subpasta `/escolha_de_parametros/` a análise das convoluções e escolha dos melhores parâmetros, e na subpasta `/curvas`/ o pós-processamento e geração dos gráficos.
  
