FROM php:5.6.30-apache
RUN docker-php-ext-install pdo pdo_mysql 
RUN docker-php-ext-install mysqli
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]