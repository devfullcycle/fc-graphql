#
# Use this dockerfile to run api-tools.
#
# Start the server using docker-compose:
#
#   docker-compose build
#   docker-compose up
#
# You can install dependencies via the container:
#
#   docker-compose run api-tools composer install
#
# You can manipulate dev mode from the container:
#
#   docker-compose run api-tools composer development-enable
#   docker-compose run api-tools composer development-disable
#   docker-compose run api-tools composer development-status
#
# OR use plain old docker 
#
#   docker build -f Dockerfile-dev -t api-tools .
#   docker run -it -p "8080:80" -v $PWD:/var/www api-tools
#
FROM php:7.4-apache

RUN apt-get update \
 && apt-get install -y git zlib1g-dev libzip-dev libicu-dev \
 && docker-php-ext-install zip intl \
 && a2enmod rewrite \
 && sed -i 's!/var/www/html!/var/www/public!g' /etc/apache2/sites-available/000-default.conf \
 && mv /var/www/html /var/www/public \
 && curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer \
 && echo "AllowEncodedSlashes On" >> /etc/apache2/apache2.conf

WORKDIR /var/www

RUN usermod -u 1000 www-data

USER www-data

COPY .docker/entrypoint.sh .

ENTRYPOINT [ ".docker/entrypoint.sh" ]

CMD [ "apache2-foreground" ]