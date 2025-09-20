# 📌 Analisando Dados Abertos de Viagens a Serviço

Este projeto tem como objetivo **analisar dados abertos de viagens a serviço** no setor público, utilizando **R** e **RStudio**.  
A proposta é explorar os gastos, identificar padrões e responder perguntas-chave para subsidiar decisões de redução de custos.

---

## 📌 Objetivo da Análise

1. Qual é o **valor gasto por órgão**?  
2. Qual é o **valor gasto por cidade**?  
3. Qual é a **quantidade de viagens por mês**?  

---

## 📌 O script realiza:
* Leitura
* Conversão de tipos (datas, fatores)
* Estatísticas descritivas
* Visualizações (histogramas, boxplots, gráficos de barras e linha)
* Geração de arquivo RMarkdown e [Relatório](https://github.com/jcarlossc/data-analysis-r/blob/main/Relatorio.pdf).

---

## 📌 Pré-requisitos

Antes de rodar o projeto, você precisa ter:

- [R](https://cran.r-project.org/) instalado (versão recomendada: ≥ 4.3)  
- [RStudio](https://posit.co/download/rstudio-desktop/) instalado  
- Pacotes necessários:
  - `dplyr`
  - `ggplot2`
- Instalação da [Linguagem R](https://informaticus77-r.blogspot.com/2025/09/blog-post.html):
- Microtutorial [RStudio:](https://informaticus77-r.blogspot.com/2025/09/blog-post_8.html)

---

## 📌 Obtenção dos Dados

Os dados utilizados podem ser baixados em:<br>
📌 Portal da Transparência - [`Viagens a Serviço`](https://portaldatransparencia.gov.br/download-de-dados/viagens). 
* Escolha o exercício de 2019.
* Baixe o arquivo.
* Descompacte-o.
* Carregue o arquivo 2019_Viagem.csv.

---

### 📌 Clonar este repositório
Abra o terminal e execute:
```bash
https://github.com/jcarlossc/data-analysis-r.git
cd data-analysis-r
```

---

### 📌 Ativar ambiente com renv
Este projeto utiliza o pacote renv para gerenciar dependências de forma reprodutível.
1. Abra o projeto no RStudio.
2. Ative o ambiente e restaure as dependências:
```
# Estes comandos devem ser executados no console do RStudio.
renv::activate()
renv::restore()
```
3. Verifique se tudo está funcionando:
```
# Este comando deve ser executado no console do RStudio.
renv::status()
```

---

### 📌 Sobre
Este material foi criado para servir como introdução ao R, com exemplos simples e organizados para facilitar o aprendizado inicial.

---

### 📌 Contribuições
Se quiser contribuir:
1. Faça um fork deste repositório
2. Crie uma branch para sua feature ou correção (git checkout -b minha-feature)
3. Faça commits descritos claramente
4. Submeta um Pull Request

---

### 📌 Licença
Este projeto está licenciado sob a MIT License.

---

### 📌 Contatos
📌Autor: Carlos da Costa<br>
📌Recife, PE - Brasil<br>
📌Telefone: +55 81 99712 9140<br>
📌Telegram: @jcarlossc<br>
📌Blogger linguagem R: [https://informaticus77-r.blogspot.com/](https://informaticus77-r.blogspot.com/)<br>
📌Blogger linguagem Python: [https://informaticus77-python.blogspot.com/](https://informaticus77-python.blogspot.com/)<br>
📌Email: jcarlossc1977@gmail.com<br>
📌Portfólio em construção: https://portfolio-carlos-costa.netlify.app/<br>
📌LinkedIn: https://www.linkedin.com/in/carlos-da-costa-669252149/<br>
📌GitHub: https://github.com/jcarlossc<br>
📌Kaggle: https://www.kaggle.com/jcarlossc/  
📌Twitter/X: https://x.com/jcarlossc1977


