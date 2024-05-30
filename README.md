# find-your-home
É um site para encontrar sua casa nova. Você também pode vender ou alugar sua casa.
  
## Infraestrutura

### Instale o Docker e o Docker-Compose

### Crie um contêiner com uma instância de banco de dados Postgres
```
docker-compose up
```
### Verifique se o contêiner foi criado
```
docker ps -a
```
### Para parar o contêiner
```
docker-compose down
```
### Execute a aplicação
```
mvn spring-boot:run
```
## Prototipagem do projeto
Rascunho funcional do produto final para validar a ideia do projeto e dar um vislumbre de como o Find Your Home será.

### Landing Page

![](https://github.com/jairocket/find-your-home/blob/main/docs/Prototypes/Capa.jpeg?raw=true)

![](https://github.com/jairocket/find-your-home/blob/main/docs/Prototypes/Fundo.jpeg?raw=true)

### Pesquisa

![](https://github.com/jairocket/find-your-home/blob/main/docs/Prototypes/Pesquisa.jpeg?raw=true)

### Detalhes

![](https://github.com/jairocket/find-your-home/blob/main/docs/Prototypes/Info_Imovel.jpeg?raw=true)

### Avaliações

![](https://github.com/jairocket/find-your-home/blob/main/docs/Prototypes/Avalaia%C3%A7%C3%B5es.jpeg?raw=true)

## Requisitos funcionais

- O mesmo CPF não pode ser cadastrado para Clientes diferentes;
- O mesmo CNPJ não pode ser cadastrado para Clientes diferentes;
- O mesmo telefone não pode ser cadastrado mais de uma vez;
- Clientes pode cadastrar um ou mais telefones;
- Apenas um telefone principal deve ser cadastrado
- O mesmo email não pode ser cadastrado para Clientes diferentes;

### Estrutura do front-end do projeto
/src
  /components   # Componentes reutilizáveis
  /pages        # Páginas do aplicativo
  /assets       # Imagens, ícones, etc.
App.css       # Arquivos de estilos (CSS, SCSS)
App.js        # Componente raiz
index.js      # Ponto de entrada do aplicativo

### Instruções básicas para iniciar o projeto localmente.
npm start

### Scripts Disponíveis
Lista dos scripts que podem ser executados com npm ou yarn.

npm start: Inicializa o servidor de desenvolvimento.

### Tecnologias Utilizadas
React
React Router
Axios
Componentes estilizados e Móulos CSS

### Link para o repositório front-end 
https://github.com/KaKeeM/WebContent 

