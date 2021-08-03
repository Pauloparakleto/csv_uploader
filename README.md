# README

Disclaimer: I'm gonna write the Background in english when the time appears. For now, you have to know it is as described bellow.

The scenario is a virtual market place specialized on sale a few type of phone devises.

# Background

Um novo cliente contratou a Alive para desenvolver uma loja virtual especializada na venda de aparelhos de telefonia celular. Para criar o inventário inicial da loja, com todos os telefones disponíveis, o estoque e seus preços, enviou arquivos CSV com os dados a incluir. Informou também que periodicamente precisará atualizar o inventário com planilhas idênticas.

Para facilitar esse processo, é necessário criar uma interface para upload desses arquivos, e uma segunda interface que permita que a pessoa avalie o inventário da loja, mostrando aparelhos, valores e quantidades, assim como dando a possibilidade de aplicar alguns filtros.

# Requisitos

1. O usuário fará upload de um arquivo .csv no formato fornecido em `input_valid` através de um formulário;
2. Os dados contidos no arquivo serão normalizados e salvos em um banco de dados relacional;
3. O usuário será redirecionado para a página com o inventário, que indicará o sucesso ou falha da importação (preferencialmente com o motivo, no caso de falha);
4. O usuário poderá visualizar os dados importados e buscá-los por fabricante, modelo e modalidade de venda (pré- ou pós-pago).

# Observações:

- A aplicação deve ser feita usando ferramentas do universo Ruby (Rails, Sinatra, Roda, Cuba, Hanami, etc);
- Não é necessário se preocupar com autenticação;
- Aspectos estéticos não são primordiais;
- A aplicação deverá ter testes automatizados.

# Start the Project in your own machine

## Clone it

1. Using SSH: `git clone git@github.com:Pauloparakleto/hiring.git`


2. Using HTTPS: `git clone https://github.com/Pauloparakleto/hiring.git`

## Bundle it

On terminal run: `bundle install`

## PostgreSQL Staff

[I don't have postgre locally](https://docs.microsoft.com/windows/wsl/tutorials/wsl-database). Follow the instruction
on the link and come back to the instructions bellow.

1. Rename the file `database.sample.yml` to `database.yml`
2. Set the password on the default area according to your password, mine is `12345`
3. Set the username on the default area to your role with privilege to create database. 
Mine is the default role. So I comment out the username line in order
to postgre reach the name of my machine.
4. Start database server: `sudo service postgresql start`

## Connect Rails to the database

Run: `rails db:create db:migrate`

Optionally you might populate the database with initial data: `rails db:seed`.
However, you will not be able to test the create workflow sense the delete action is not part of the
current release.

Any way, you may delete the data to restart the create workflow by running: 
`rails db:drop db:create db:migrate`

## Run the server

Run: `rails server`

## Testing it

At least but also important, run the tests: `rspec`

## Contributing

Should I say more? Keep the pipeline green and avoid headache. 

[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

[![Rails Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rails.rubystyle.guide)


