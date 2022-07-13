FROM wordpress:6.0-php7.4-apache

RUN apt update && apt install -y \
        less \
        wget \
        nano \
        curl \
        git \
    && rm -rf /var/lib/apt/lists/* \
    # Sendmail for Mailhog
    && curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz \
    && tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc \
    && /usr/local/go/bin/go get github.com/mailhog/mhsendmail \
    && ln  ~/go/bin/mhsendmail /usr/local/bin/mhsendmail \
    # Install XDebug
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# RUN a2enmod rewrite

COPY ./php/conf.d/mailhog.ini /usr/local/etc/php/conf.d/mailhog.ini

COPY ./scripts/xdebug-disable.sh /usr/local/bin/xdebug-disable
COPY ./scripts/xdebug-enable.sh /usr/local/bin/xdebug-enable

RUN chmod +x /usr/local/bin/xdebug-disable \
    && chmod +x /usr/local/bin/xdebug-enable
