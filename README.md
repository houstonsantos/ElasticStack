# Elastic Stack

Afinal, o que é o ELK Stack? "ELK" é o acrônimo para três projetos open source: Elasticsearch, Logstash e Kibana. O Elasticsearch é um mecanismo de busca e análise. O Logstash é um pipeline de processamento de dados do lado do servidor que faz a ingestão de dados a partir de inúmeras fontes simultaneamente, transforma-os e envia-os para um "esconderijo" como o Elasticsearch. O Kibana permite que os usuários visualizem dados com diagramas e gráficos no Elasticsearch.

<p align="center">
    <img width="600" height="400" src="https://miro.medium.com/max/700/0*O6aGxGkIlazsHi-p">
</p>

O Elastic Stack é a próxima evolução do ELK Stack. Quer saber mais da uma olhadinha neste [Link](https://www.elastic.co/pt/what-is/elk-stack)


## Elatic Stack com Docker

<div style="clear: right;">
    <p style="float: right;">
        <img width="350" height="200" src="https://miro.medium.com/max/1280/0*D83ZpjexukNKQruA.png">
    </p>
    <p>
        O objetivo aqui é realizar a implementação da pilha do Elastic Stack utilizando Docker Compose. Iremos utilizar dos mais diversos recursos que a solução nos oferece em um projeto Self-Managed Standalone.
    </p>
</div>

**Recusos abordados**
  * Kibana
  * Elasticsearch (single node)
  * Logstash
  * Bets

>A ideia é aborda recursos nativos da solução da Elastic como; a camada de segurança [Elastic Security Layer](https://www.elastic.co/guide/en/elasticsearch/reference/current/configuring-stack-security.html), filebeat, metricbeat entre outros. Podendo assim servir como ponto de partida para outros projetos dos mais diversos.

## 1. Ambiente de projeto
Com o Docker e Compose já instalados clone o repositório, o mesmo deve ter a seguinte estrutura:
```
.
├── README.md
├── beats
│   ├── filebeat.yml
│   └── metricbeat.yml
├── docker-compose-beats.yml
├── docker-compose-elk.yml
└── logstash
    ├── logstash.yml
    └── pipelines.yml
```

### Variáveis de ambiente
Configuração do arquivo .env:
>Neste arquivo você deve informa usuário e senha para o elastic. Note que tenho uma seção para o Kibana e Logstash, na medida que você for customisando seu projeto, para uma melhor organização você deve utilizá-las.
```
# ElasticSearch
ELASTIC_USER=elastic
ELASTIC_PASSWORD=elastic

# Kibana

# Logstash
```

## 2. Estrutura do projeto
Note que você terá dois arquivos .yml o docker-compose-elk.yml e o docker-compose-beats.yml. Por que disso?
O projeto foi divididdo dessa forma por varios motivos; primeiro que desta forma você terá duas pilhas de execução, uma do ELK e outra para os Beats, assim se você usa em seu ambiente de teste ou desenvolvimento, você pode executar a pilha dos Betas quando for realmente necessário, e em um ambiente de produção você poderar ter maior flexibilidade entre os serviços, principalmente em manutenções. Porem deixei tudo isso em um único projeto.

## 3. Beats
Atualmente o projeto tem os beats, filebeat e metribeat com os seguintes módulos habilitados:
* **filebeat**
  * netflow
  * system
  * docker
* **metricbeat**
  * postgresql

>AVISO: Existem várias maneiras de se configurar os Beats, para este projeto faço uso exclusivamente dos arquivos filebeats.yml e metricbeat.yml nele é possível estar habilitando e configurando os móduos, sem a necessidade de qualquer outra configuração ou interação via CLI.

## 4. Build do projeto
Build do arquivo docker-compose-elk.yml, com ele você vai subir a pilha com Elasticsearch, Kibana e Logstash.
```
docker compose -f docker-compose-elk.yml up -d
```

Build do arquivo docker-compose.beats.yml, agora teremos a pilha resposável pelos Beats.
```
# Note que a opção <-p beats> referesse ao nome do projeto que estou diferenciando do original que seria elasticsatck, com isso você tera duas pilhas sendo executadas no Docker.
docker compose -f docker-compose-beats.yml -p beats up -d
```
<p align="center">
    <img width="800" height="500" src="img/elastic.gif">
</p>

## 5. Resultado do projeto
>Duas pilhas uma executando o ELK e outras executando os Betas!

<p align="center">
    <img width="600" height="375" src="img/docker.png">
</p>