#this is docker file for test project

FROM centos:latest
MAINTAINER sagar.charles7@gmail.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page270/unika.zip /var/www/html
WORKDIR /var/www/html
RUN unzip unika.zip
RUN cp -rvf unika-html/* .
RUN rm -rf unika-html unika.zip
CMD ["/usr/sbin/httpd", "-D" "FOREGROUND"]
EXPOSE 80
