FROM httpd:2.4-alpine

MAINTAINER Kyle Spiers

COPY ./index.html /usr/local/apache2/htdocs/index.html

EXPOSE 443
