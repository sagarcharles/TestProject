#this is docker file for test project

FROM centos:latest
MAINTAINER sagar.charles7@gmail.com
RUN sudo apt-get update
RUN sudo apt-get install apache2\
zip\
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page270/unika.zip /var/www/html
WORKDIR /var/www/html
RUN unzip unika.zip
RUN cp -rvf unika-html/* .
RUN rm -rf unika-html unika.zip
CMD ["/usr/sbin/httpd", "-D" "FOREGROUND"]
EXPOSE 80
