# DesenvolveGB
Repositório do projeto Desenvolve GB - Engenharia de Dados 2025
# 🧪 Análise de Dados com Python e Pandas

Este repositório contém a resolução completa de um projeto de análise exploratória de dados, utilizando ferramentas como **Python**, **Pandas**, **NumPy**, **Matplotlib** e **Seaborn**.

A base analisada representa um conjunto de pedidos de uma empresa fictícia, contendo informações como data da compra, cliente, produto, valor da venda e outras dimensões relevantes.

---

## 📁 Estrutura do Projeto

- `analise_dados.ipynb`: notebook com todo o passo a passo das análises.
- `README.md`: este arquivo com as explicações detalhadas das atividades e descobertas.
- `base.csv`: (opcional) base de dados utilizada, se puder ser compartilhada.

---

## ✅ Atividades Realizadas

### 1. **Leitura da Base de Dados**
- Link do arquivo no Google Drive foi carregado no Colab.
- Utilizamos a biblioteca `gdown` para fazer o download.
- A base foi convertida em um DataFrame do Pandas.

---

### 2. **Visualização Inicial**
- Verificação de colunas, tipos de dados e dimensões do DataFrame.
- Exibição das 5 primeiras linhas com `.head()`.
- Verificação de nulos, estrutura da base e valores únicos em colunas-chave.

---

### 3. **Listas, Dicionários e Tuplas**
- Extraímos a coluna `CUSTOMERNAME` em uma lista e percorremos com `for`.
- Criamos um dicionário relacionando `PRODUCTCODE : PRODUCTLINE`.
- Montamos uma tupla com `ORDERNUMBER`, `CUSTOMERNAME` e `SALES` de uma linha.

---

### 4. **Condicionais e Laços**
- Utilizamos `if/elif/else` para classificar o valor de `SALES` (alto, médio ou baixo).
- Calculamos a soma das 5 primeiras vendas com `for`.
- Usamos `while` para encontrar o primeiro valor de `SALES` acima de R$ 9000.

---

### 5. **Operações Aritméticas e Novas Colunas**
- Criamos a coluna `PRECO_TOTAL_CALCULADO = PRICEEACH * QUANTITYORDERED`.
- Aplicamos um desconto de 10% e criamos a coluna `PRECO_DESCONTO_10`.

---

### 6. **NumPy e Arrays Numéricos**
- Transformamos a coluna `SALES` em um array NumPy.
- Aplicamos operações vetorizadas como soma e exponenciação.
- Demonstramos slicing, modificação de valores e operações agregadas (soma, média).

---

### 7. **Acesso e Agrupamento com Pandas**
- Usamos `.iloc` e `.loc` para acessar colunas e linhas específicas.
- Filtramos registros por condições (ex: vendas acima de R$ 10.000).
- Utilizamos `.groupby()` e `.value_counts()` para gerar insights por categoria.

---

### 8. **Visualização de Dados**
- **Gráfico de Linha**: tendência de vendas ao longo do tempo.
- **Gráfico de Barras**: comparação de vendas por linha de produto.
- **Gráfico de Dispersão**: relação entre preço unitário e quantidade vendida.
- Utilizamos `matplotlib` e `seaborn` para tornar as visualizações mais elegantes.

---

### 9. **Relatório e Insights**

#### 🔎 Principais Descobertas

- Picos de vendas em datas específicas sugerem **sazonalidade**.
- A categoria **Classic Cars** domina em volume de vendas.
- Produtos com **preços mais altos** tendem a ter **menor volume vendido**.
- Tamanhos de negócio predominantes são **pequeno e médio**.
- Discrepâncias entre `SALES` e o total calculado sugerem **ajustes no sistema** (descontos, impostos, arredondamentos).

#### 📌 Relatório Final

```markdown
## Relatório Final

Neste projeto, explorei a base de pedidos de vendas com X linhas e Y colunas. 
Através de operações com listas, dicionários, tuplas, NumPy e Pandas, realizei análises exploratórias e criei visualizações que revelaram padrões de comportamento de clientes e produtos.

### Perguntas futuras a serem investigadas:
- Como se distribuem as vendas por país?
- Qual é o tempo médio entre pedidos por cliente?
- Produtos mais caros são realmente mais lucrativos?
