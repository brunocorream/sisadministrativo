FROM ruby:2.3-slim
# Instalando as dependências
RUN apt-get update -y && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# Definindo um caminho absoluto
ENV INSTALL_PATH /usr/src/app
# Criando um diretório para receber a instalação
RUN mkdir -p $INSTALL_PATH
# Definindo a pasta principal
WORKDIR $INSTALL_PATH
# Copiando o gemfile para dentro do projeto
COPY Gemfile ./
# Instalando todas as Gems
RUN bundle install
# Copiando o código para dentro do container
COPY . .
# Iniciando o servidor
CMD puma -C config/puma.rb