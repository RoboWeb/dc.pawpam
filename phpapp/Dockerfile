# syntax=docker/dockerfile:1.4

FROM --platform=$BUILDPLATFORM php:8.2.18-apache as builder

CMD ["apache2-foreground"]
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
# Enable Apache modules
RUN a2enmod rewrite
RUN a2enmod ssl
COPY confs/apache-config.conf /etc/apache2/sites-enabled/000-default.conf
RUN service apache2 restart

FROM builder as dev-envs

RUN apt-get update && \
    apt-get install -y --no-install-recommends git \
    && docker-php-ext-install mysqli pdo_mysql



RUN useradd -s /bin/bash -m vscode && \
    groupadd docker && \
    usermod -aG docker

# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /

CMD ["apache2-foreground"]
