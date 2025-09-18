
# ANALISANDO DADOS ABERTOS DE VIAGENS A SERVIÇO.

# A proposta deste tópico é colocar em prática algumas das 
# funções do R trabalhando com a análise de dados abertos 
# de viagens a serviço, com o intuito de subsidiar a tomada 
# de medidas mais eficientes na redução dos gastos com os 
# custos dessas viagens no setor público.

# 1. DEFINIÇÃO DO PROBLEMA.

# Para resolver um problema, primeiramente temos que entendê-lo. 
# Assim, precisamos entender os gastos com viagens a serviço 
# para tomar medidas mais eficientes e, com isso, reduzir os 
# custos dessas viagens.

# 1. Qual é o valor gasto por órgão?
# 2. Qual é o valor gasto por cidade?
# 3. Qual é a quantidade de viagens por mês?

# 2. OBTENÇÃO DOS DADOS.

# Para entender como obter os dados que vamos usar na análise,
# Acesse: https://portaldatransparencia.gov.br/download-de-dados/viagens
# Baixe em Exercícios Disponíveis do ano de 2019.
# Descompacte o arquivo. Escolha o 2019_Viagem.csv

# Para mais informações sobre a função read.csv(), retire o cerquilha e
# execute o comando:
# ?read.csv()

# Alterar o valor do campo file com o caminho completo do diretório em 
# que se encontra o arquivo 2019_viagem.csv.
# Exemplo file = "C:/Users/Documents/Datasets/2019_Viagem.csv"
# Nesse exemplo, o arquivo 2019_Viagem.csv está no diretório file na
# raiz do projeto.
viagens <- read.csv(file = "file/2019_Viagem.csv", 
                    sep = ";", 
                    dec = ",",
                    fileEncoding = "Latin1")

# Visualizando as primeiras linhas do dataset - 
# verificar se dados foram carregados corretamente.
head(viagens)

# Exibe dados em um formato de tabela semelhante a uma planilha.
View(viagens)

# Verificar dimensões do dataset - quantidades de linhas e colunas.
dim(viagens)

# Resumo do dataset - valores min, max, media, mediana...
summary(viagens)

# Resumo de uma coluna especifica
summary(viagens$Valor.passagens)

# Verificar tipo dos dados

# Instalar a biblioteca dplyr - instalar no console.
# install.packages("dplyr")
# A função library() invoca a biblioteca 
library(dplyr)

# Afunção glimpse() apresenta os tipos de dados das colunas.
glimpse(viagens)

# ------------------------------------------------------------------


