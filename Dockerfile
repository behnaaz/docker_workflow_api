#use the excellent phusion/passenger image
FROM phusion/passenger-ruby21:0.9.15
MAINTAINER Daniël van Gils

#install poltergeist and browserstack local tunnel
RUN apt-get update -y
RUN apt-get upgrade -y

#set working dir
WORKDIR /tmp

#cache bundle install
ADD api/Gemfile /tmp/Gemfile
ADD api/Gemfile.lock /tmp/Gemfile.lock
RUN bundle install

#set working dir
WORKDIR /home/app


#getting al files together
ADD . /home/app

RUN rm -f /etc/service/nginx/down
ADD api/nginx/default.conf /etc/nginx/sites-available/default
ADD api/nginx/nginx.conf /etc/nginx/nginx.conf
ADD api/nginx/mysql-env.conf /etc/nginx/main.d/mysql-env.conf


EXPOSE 80
CMD ["nginx"]