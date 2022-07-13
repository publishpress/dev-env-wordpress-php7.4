FROM wordpress:6.0-php7.4-apache

RUN apt update && apt install -y \
        less \
        wget \
        nano \
        curl \
        git \
        zip \
    && rm -rf /var/lib/apt/lists/* \
    # Sendmail for Mailhog
    && curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz \
    && tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc \
    && /usr/local/go/bin/go get github.com/mailhog/mhsendmail \
    && ln  ~/go/bin/mhsendmail /usr/local/bin/mhsendmail

COPY ./php/conf.d/mailhog.ini /usr/local/etc/php/conf.d/mailhog.ini
