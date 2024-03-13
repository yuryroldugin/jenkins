FROM redhat/ubi8
RUN yum -y install httpd
COPY ./index.html /var/www/html
EXPOSE 80
CMD httpd -D FOREGROUND
