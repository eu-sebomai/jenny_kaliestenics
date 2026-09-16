FROM rockylinux:9

LABEL org.opencontainers.image.authors="vatamaniuc.sebi@gmail.com"

RUN dnf install -y httpd unzip zip

ADD https://github.com/mrhornsby/html5up-stellar/archive/refs/heads/master.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip master.zip

RUN cp -rvf html5up-stellar-master/* .

RUN rm -rf html5up-stellar-master master.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
