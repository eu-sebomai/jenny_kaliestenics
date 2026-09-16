FROM centos:7

LABEL org.opencontainers.image.authors="vatamaniuc.sebi@gmail.com"

RUN yum install -y httpd \
zip\
unzip

ADD https://html5up.net/uploads/demos/story/download.zip /var/www/html/ /var/www/html/

WORKDIR /var/www/html/

RUN unzip download.zip

RUN cp -rvf download/* .

RUN rm -rf download download.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
