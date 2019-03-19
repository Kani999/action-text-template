FROM ruby:2.6.2

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs 
RUN apt-get update 

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y build-essential
RUN apt-get install npm -y
RUN npm install -g yarn

RUN apt-get install sqlite -y
RUN apt-get update



RUN mkdir /mnt/rails
WORKDIR /mnt/rails

COPY Gemfile /mnt/rails/
COPY Gemfile.lock /mnt/rails/

# Bundle install
RUN bundle install
COPY . /mnt/rails
COPY db/development.sqlite3 /mnt/rails/db/development.sqlite3
RUN yarn add https://github.com/kobaltz/actiontext
RUN bundle

EXPOSE 3000
