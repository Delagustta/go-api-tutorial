# Product Service API

Esta é uma API escrita em Golang (versão 1.23). A API foi configurada para ser executada exclusivamente dentro de containers Docker. Com o Docker e Docker Compose configurados, é possível gerar a imagem e subir os containers facilmente.


## Introdução

### Pré-requisitos

- Golang 1.23
- PostgreSQL

### Instalação

1. Clone o repositório:
    ```bash
    git clone git@github.com:Delagustta/go-api-tutorial.git
    cd go-api-tutorial
    ```

2. Gere o build da API:
    ```bash
    docker build -t go-api-tutorial .
    ```

3. Suba os containers:
    ```bash
    docker-compose up -d
    ```

## Configuração do Banco de Dados

Devemos criar a tabela `product`, siga os passos abaixo:

1. Conecte-se ao banco de dados PostgreSQL utilizando DBeaver ou similar.
Certifique-se de que as variáveis de ambiente para a conexão com o banco de dados estejam corretamente configuradas:
```bash
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=1234
DB_NAME=postgres
```
2. Execute as seguintes queries SQL para criar a tabela `product` e inserir um produto de exemplo:

    ```sql
    create table product (
        id SERIAL primary key,
        product_name varchar(50) not null,
        price numeric(10,2) not null
    );

    insert into product (product_name, price) values ('sushi', 100);
    ```

## Observação

Caso queira subir a API localmente sem o Docker, basta comentar a parte `go_app` no `docker-compose.yml` e usar o comando:

```bash
go run main.go
