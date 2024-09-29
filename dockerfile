# tai OS cua image
FROM ubuntu:24.04

# set bien moi truong de khong hien thi cac thong bao cua apt-get
ENV DEBIAN_FRONTEND=noninteractive

# tai php, mysql, nginx va cac package can thiet
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    nginx \
    mysql-client \
    php \
    php-fpm \
    php-cli \
    php-xml \
    php-mysql \
    php-bcmath \
    php-ctype \
    php-curl \
    php-gd \
    php-intl \
    php-mbstring \
    php-soap \
    php-xsl \
    php-zip \
    php-json \
    php-iconv \
    vim \
    && apt-get clean

# Modify php.ini files
RUN PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;") \
    && sed -i "s/memory_limit = .*/memory_limit = 2G/" /etc/php/$PHP_VERSION/fpm/php.ini \
    && sed -i "s/max_execution_time = .*/max_execution_time = 1800/" /etc/php/$PHP_VERSION/fpm/php.ini \
    && sed -i "s/zlib.output_compression = .*/zlib.output_compression = On/" /etc/php/$PHP_VERSION/fpm/php.ini \
    && sed -i "s/memory_limit = .*/memory_limit = 2G/" /etc/php/$PHP_VERSION/cli/php.ini \
    && sed -i "s/max_execution_time = .*/max_execution_time = 1800/" /etc/php/$PHP_VERSION/cli/php.ini \
    && sed -i "s/zlib.output_compression = .*/zlib.output_compression = On/" /etc/php/$PHP_VERSION/cli/php.ini 

WORKDIR /var/www/html 

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
    && echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list \
    && apt-get update && apt-get install -y elasticsearch 

# cai dat composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .

RUN cd /var/www/html \
    && find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + \
    && find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + \
    && chown -R :www-data . \
    && chmod u+x bin/magento 

RUN cd /var/www/html/bin \
    ./magento deploy:mode:set developer

COPY ./nginx_conf/webtest.net /etc/nginx/sites-available/webtest.net

RUN ln -s /etc/nginx/sites-available/webtest.net /etc/nginx/sites-enabled/webtest.net \
    && unlink /etc/nginx/sites-enabled/default 

# cai dat cong 80 cho container (listen container o cong nay)
EXPOSE 80

COPY ./start_service.sh /usr/local/bin/start_service.sh
RUN chmod +x /usr/local/bin/start_service.sh

# start service php-fpm va nginx (daemon off de ko chay ngam - tranh bi stop container)
CMD ["/usr/local/bin/start_service.sh"]