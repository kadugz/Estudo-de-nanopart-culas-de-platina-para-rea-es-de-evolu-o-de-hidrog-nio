# Iniciação Científica FAPESP — Simulações DFT e XANES

**Bolsista:** Carlos Eduardo Santos
**Orientador:** Prof. James Moraes de Almeida (ILUM/CNPEM)
**Período:** 2024–2025

Este repositório reúne os arquivos relevantes, dados e scripts utilizados durante a Iniciação Científica financiada pela FAPESP. O projeto envolve o uso de métodos de **Teoria do Funcional da Densidade (DFT)** e simulações **XANES** para o estudo de propriedades eletrônicas e estruturais de sistemas metálicos com potencial aplicação catalítica.

## Estrutura do Repositório

* `espresso/` — arquivos de entrada e saída das simulações, do software Quantum ESPRESSO, para obter as energias dos três modelos de partícula - cuboctaédricas de 55 átomos, e 116 átomos, bem como Distorced Reduced Core de 55 átomos (DRC). Esses dados, futuramente, foram usadas no cálculo dos $\Delta G$s.
* `fdmnes/` — arquivos de entrada e saída das simulações, do software FDMNES, para obter as curvas de abosrção de raios-X próximos a borda (XANES) de cada sítio. Como os dados da DRc foram mais distantes que as cuboctaédricas, segue-se com os XANES das partículas cuboctaédricas. 

## Observação

Os arquivos são destinados apenas ao armazenamento e registro do progresso da pesquisa, sem fins de divulgação pública de resultados finais.
