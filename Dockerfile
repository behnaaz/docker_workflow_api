#use the excellent phusion/passenger image
FROM phusion/passenger-ruby21:0.9.15
MAINTAINER Daniël van Gils

#set working dir
WORKDIR /tmp

#cache bundle install
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN bundle install

#set working dir
WORKDIR /home/app

#getting al files together
ADD . /home/app

RUN rm -f /etc/service/nginx/down
ADD nginx/default.conf /etc/nginx/sites-available/default
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/mysql-env.conf /etc/nginx/main.d/mysql-env.conf

EXPOSE 80
CMD nginx