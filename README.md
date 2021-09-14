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

>A ideia e aborda recursos nativos da solução da Elastic como; a camada de segurança [Elastic Security Layer](https://www.elastic.co/guide/en/elasticsearch/reference/current/configuring-stack-security.html), filebeat, metricbeat entre outros. Podendo assim servir como ponto de partida para outros projetos dos mais diversos.