
# ANALIZANDO DADOS ABERTOS DE VIAGENS A SERVIÇO.

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

# TRANSFORMAÇÃO DOS DADOS OBTIDOS.

# A transformação de dados é o processo de converter dados brutos de 
# um formato ou estrutura para outro, tornando-os mais úteis para 
# análise e tomada de decisão. Isso envolve limpar, estruturar, 
# organizar e alterar os dados para garantir que sejam consistentes, 
# confiáveis e compatíveis com os sistemas de destino.

# Normalmente as colunas podem vir com os tipos de dados "trocados",
# ou seja, datas, horas, quantidades são criados como texto(string),
# como é mostrado ao executar a função glimpse(),
# por isso é necessário transformá-los para seus tipos naturais:
# datas para DATE, horas para TIME e quantidades para INTEIROS e assim
# por diante.

#Convertendo o tipo do dato para tipo DATE.
# Para mais informações sobre a função as.Date(), retire o cerquilha e
# execute o comando:
# ?as.Date

# Cria-se uma nova coluna data.inicio com o tipo DATE.
viagens$data.inicio <- as.Date(viagens$Período...Data.de.início, "%d/%m/%Y")

# Ao execultar a função glimpse(), percebe-se que agora o tipo é DATE. 
glimpse(viagens)

#Formatando a data de inicio - para utilizar apenas Ano/Mês
# Para mais informações sobre a função format(), retire o cerquilha e
# execute o comando:
# ?format()
viagens$data.inicio.formatada <- format(viagens$data.inicio, "%Y-%m")

# Ao execultar a função glimpse(), percebe-se que o formato da coluna
# data.inicio mudou para Ano/Mês. 
glimpse(viagens)

# ------------------------------------------------------------------

# EXPLORAÇÃO DOS DADOS.

# A exploração de dados geralmente envolve a visualização de 
# dados para ajudá-lo a compreender a estrutura do conjunto 
# de dados, a presença de valores discrepantes e a distribuição 
# dos valores dos dados.

# Exemplo de histograma - filtrando valores
# Para esse exemplo serão utilizadas as funções filter e select
# ?dplyr::filter
# ?dplyr::select

#Filtrando os valores das passagens - apenas passagens entre 200 e 5000.
passagens_fitro <- viagens %>%
  select(Valor.passagens) %>%
  filter(Valor.passagens >= 200 & Valor.passagens <= 5000)

# Usando a variável criada.
hist(passagens_fitro$Valor.passagens)

# Verificando os valores min, max, média... da coluna valor
summary(viagens$Valor.passagens)

# Visualizando os valores em um boxplot.
boxplot(viagens$Valor.passagens)

# Visualizando os valores das passagens - filtro de 200 a 5000.
boxplot(passagens_fitro$Valor.passagens)

# Calculando o desvio padrão.
sd(viagens$Valor.passagens)

# Verificar se existem valores não preenchidos nas colunas do dataframe.
# A função is.na() verifica a existência de valos vazios.
# A função colSums() calcula a soma dos valores em cada coluna de uma 
# matriz ou dataframe.
# Ao combinar is.na() com colSums(), é possível contar a quantidade de 
# valores NA em cada coluna de um dataframe.
# ?is.na
# ?colSums

colSums(is.na(viagens))

# Converter para factor.
viagens$Situação <- factor(viagens$Situação)

# Verifcar a quantidade de categorias da coluna Situação.
str(viagens$Situação)

# Verificar quantidade de registros em cada categoria.
table(viagens$Situação)

# Obtendo os valores em percentual de cada categoria.
prop.table(table(viagens$Situação)) * 100

# ------------------------------------------------------------------

# VISUALIZAÇÃO DOS DADOS.


# 1 - Qual é o valor gasto por órgão em passagens?

# Criando um dataframe com os 15 órgãos que gastam mais.
library(dplyr)

p1 <- viagens %>%
  group_by(Nome.do.órgão.superior) %>%
  summarise(n = sum(Valor.passagens)) %>%
  arrange(desc(n)) %>%
  top_n(15)

# Imprime o resultado.
p1

#Alterando o nome das colunas pata plotagem.
names(p1) <- c("orgao", "valor")

# Plotando os dados com o ggplot2.
# Instalat a biblioteca ggplot2 - no console -
# install.packages("ggplot2") 
library(ggplot2)

ggplot(p1, aes(x = reorder(orgao, valor), y = valor))+
  geom_bar(stat = "identity")+
  coord_flip()+
  labs(x = "Valor", y = "Órgãos")

# 2 - Qual é o valor gasto por cidade?

# Criando um dataframe com as 15 cidades que gastam mais.
p2 <- viagens %>%
  group_by(Destinos) %>%
  summarise(n = sum(Valor.passagens)) %>%
  arrange(desc(n)) %>%
  top_n(15)

# Imprime o resultado.
p2

#Alterando o nome das colunas.
names(p2) <- c("destino", "valor")

# Criando o gráfico.
ggplot(p2, aes(x = reorder(destino, valor), y = valor))+
  geom_bar(stat = "identity", fill = "#0ba791")+
  geom_text(aes(label = valor), vjust = 0.3, size = 3)+
  coord_flip()+
  labs(x = "Valor", y = "Destino")

# 3 - Qual é a quantidade de viagens por mês?

# Criando um dataframe com a quantidade de viagens por Ano/mês
p3 <- viagens %>%
  group_by(data.inicio.formatada) %>%
  summarise(qtd = n_distinct(Identificador.do.processo.de.viagem))

head(p3)

#Criando o gráfico
ggplot(p3, aes(x = data.inicio.formatada, y = qtd, group = 1))+
  geom_line()+
  geom_point()

# ------------------------------------------------------------------

# GERANDO ARQUIVO R MARKDOWN.

# Na linguagem R é possível usar o Markdown para formatar os seus relatórios.

# Instalação do Rmarkdown.
# O pacote rmarkdown ajuda você a criar documentos de análise 
# dinâmica que combinam código, resultados renderizados 
# (como figuras) e texto.
# install.packages("rmarkdown")

# O pacote tinytex instala a distribuição LaTeX TinyTeX, que é 
# essencial e leve, para compilar documentos R Markdown em PDF, 
# instalando automaticamente pacotes LaTeX faltantes, garantindo 
# que os usuários do RStudio possam gerar relatórios PDF com facilidade. 
# install.packages('tinytex')

# A função tinytex() invoca a biblioteca. 
library(tinytex)

# Esta linha poderá levar alguns minutos para terminar a execução.
# Acompanhe o progresso na aba console e aguarde a instalação ser finalizada.
# tinytex::install_tinytex()

# Criar um arquivo R Markdown: File > New File RMarkdown
# Criar script
# Gerar Relatório: Knit > Knit to PDF

