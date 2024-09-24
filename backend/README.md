
# Express on Netlify with Postage Management

Este projeto é uma API para gerenciamento de posts, construída utilizando Express e implementada com TypeScript. A arquitetura do projeto segue o padrão em camadas, semelhante ao framework NestJS, para facilitar a organização e manutenção do código.

## Estrutura do Projeto

```plaintext
project/
│
├── netlify/
│   └── functions/
│       └── api.ts
│
├── package.json
├── netlify.toml
├── tsconfig.json
├── node_modules/
├── app/
│   ├── controller/
│   │   └── post.controller.ts
│   ├── service/
│   │   └── post.service.ts
│   ├── database/
│   │   └── databaseHelper.ts
│   └── app.module.ts
├── dist/
└── index.ts
```

## Descrição das Pastas e Arquivos

- **netlify/functions/api.ts**: Configuração do servidor para ser utilizado com o Netlify Functions e Serverless.
- **app/app.module.ts**: Módulo principal que registra todos os controladores e serviços.
- **app/controller/post.controller.ts**: Controlador que trata as requisições HTTP para as rotas relacionadas aos posts.
- **app/service/post.service.ts**: Serviço que contém a lógica de negócios para manipular os dados dos posts.
- **app/database/databaseHelper.ts**: Helper para interação com o banco de dados Firebase.
- **index.ts**: Ponto de entrada da aplicação, inicializa o servidor Express.
- **tsconfig.json**: Configurações do TypeScript.
- **package.json**: Configurações do npm e lista de dependências.

## Configuração do Ambiente

1. **Clone o repositório**:

    ```bash
    git clone https://github.com/marco0antonio0/API-Postage-Management
    cd seu-repositorio
    ```

2. **Instale as dependências**:

    ```bash
    npm install
    ```

3. **Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis de ambiente**:

    ```plaintext
    FIREBASE_API_KEY=your_firebase_api_key
    FIREBASE_AUTH_DOMAIN=your_firebase_auth_domain
    FIREBASE_DATABASE_URL=your_firebase_database_url
    FIREBASE_PROJECT_ID=your_firebase_project_id
    FIREBASE_STORAGE_BUCKET=your_firebase_storage_bucket
    FIREBASE_MESSAGING_SENDER_ID=your_firebase_messaging_sender_id
    FIREBASE_APP_ID=your_firebase_app_id
    FIREBASE_MEASUREMENT_ID=your_firebase_measurement_id
    ```

4. **Inicie o servidor de desenvolvimento**:

    ```bash
    npm run dev
    ```

5. **Configure o Netlify**:

    - Crie uma conta e um novo site no Netlify.
    - Configure o repositório do GitHub no Netlify.
    - Adicione as variáveis de ambiente no painel de configurações do Netlify.

## Utilização das Rotas

### 1. Recuperar todos os posts

- **Método:** GET
- **URL:** `/api/posts`

**Exemplo de Resposta:**

```json
[
    {
        "id": "post1",
        "title": "First Post",
        "type": "blog",
        "text": "This is the content of the first post."
    },
    {
        "id": "post2",
        "title": "Second Post",
        "type": "article",
        "text": "This is the content of the second post."
    }
]
```

### 2. Recuperar um post específico pelo ID

- **Método:** GET
- **URL:** `/api/posts/:id`

**Exemplo de Resposta:**

```json
{
    "id": "post1",
    "title": "First Post",
    "type": "blog",
    "text": "This is the content of the first post."
}
```

### 3. Criar um novo post

- **Método:** POST
- **URL:** `/api/posts`
- **Body (JSON):**

```json
{
    "title": "New Post",
    "type": "blog",
    "text": "This is the content of the new post."
}
```

**Exemplo de Resposta:**

```json
{
    "id": "newPostId",
    "title": "New Post",
    "type": "blog",
    "text": "This is the content of the new post."
}
```

### 4. Atualizar um post existente pelo ID

- **Método:** PUT
- **URL:** `/api/posts/:id`
- **Body (JSON):**

```json
{
    "title": "Updated Post Title",
    "type": "blog",
    "text": "This is the updated content of the post."
}
```

**Exemplo de Resposta:**

```json
{
    "id": "post1",
    "title": "Updated Post Title",
    "type": "blog",
    "text": "This is the updated content of the post."
}
```

### 5. Deletar um post existente pelo ID

- **Método:** DELETE
- **URL:** `/api/posts/:id`

**Exemplo de Resposta:**

- **Status Code:** 204 No Content
- **Body:** (nenhum)

## Documentação Swagger

A documentação da API é gerada automaticamente pelo Swagger. Para acessar a documentação interativa da API, siga os passos abaixo:

1. **Inicie o servidor de desenvolvimento** (caso ainda não tenha feito):

    ```bash
    npm run dev
    ```

2. **Acesse a documentação do Swagger no navegador**:

    Abra seu navegador e acesse a URL `http://localhost:3000/api-docs`. A partir desta interface, você pode visualizar e testar todas as rotas da API.

## Contribuição

Contribuições são bem-vindas! Por favor, siga os passos abaixo para contribuir:

1. Fork o repositório.
2. Crie uma nova branch (git checkout -b feature/nova-feature).
3. Commit suas alterações (git commit -am 'Adiciona nova feature').
4. Push para a branch (git push origin feature/nova-feature).
5. Crie um novo Pull Request.

## Licença

Este projeto é licenciado sob a licença. Veja o arquivo [LICENSE](LICENSE.md) para mais detalhes.
