FROM centos:7

LABEL org.opencontainers.image.authors="vatamaniuc.sebi@gmail.com"

RUN yum install -y httpd \
zip\
unzip

ADD https://github.com/mrhornsby/html5up-stellar/archive/refs/heads/master.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip master.zip

RUN cp -rvf master/* .

RUN rm -rf master master.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
