# README

## Como testar?

Após baixar o projeto

```sh
bundle install
```

Caso queira popular com dados fictícios

```sh
rails db:seed
rails s
```

Caso queira resetar os dados

```sh
rails db:reset
rails s
```

Ou apenas queira inserir seus próprios dados

```sh
rails s
```

## API

### Buffet

#### GET /api/v1/buffets

| Parâmetro | Obrigatório | Descrição    |
|-----------|-------------|--------------|
| `id`      | Não         | ID do buffet |

#### GET /api/v1/buffets/search

| Parâmetro | Obrigatório | Descrição             |
|-----------|-------------|-----------------------|
| `name`    | Sim         | Nome exato do buffet |

### Evento

#### GET /api/v1/events

| Parâmetro | Obrigatório | Descrição    |
|-----------|-------------|--------------|
| `id`      | Sim         | ID do evento |

#### GET /api/v1/events/availability

| Parâmetro | Obrigatório | Descrição    |
|-----------|-------------|--------------|
| `id`      | Sim         | ID do evento |
| `date`    | Sim         | Data do evento |
| `quantity` | Sim        | Quantidade de pessoas do evento |