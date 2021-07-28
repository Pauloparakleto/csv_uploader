# README

Disclaimer: I'm gonna write the Background in english when the time appears. For now, you have to know it is as described bellow.

The scenario is a virtual market place specialized on sale a few type of phone devises.

The final functionality is not so important as the way I'm walking on it.
It is gonna be a simple way for customers to upload a valid and an invalid CSV file.


All hard way I'd face, I have documented it on my repository whose listed issues is the necessity of knowledge about these things.


[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

[![Rails Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rails.rubystyle.guide)

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
