FROM alpine
MAINTAINER trotro

# Install PHP
RUN apk update \
	&& apk add \
	php-common php-mcrypt php-soap php-xmlreader \
	php-curl php-intl php-zlib \
	php-enchant php-zip php-dom php-gettext \
	php-mysql php-mysqli php-pear php-pdo_mysql php-json \
	php-pdo php-gd php-openssl php-iconv \
	php-xml php-xsl php-fpm php-ctype \
	# forward request and error logs to docker log collector
	&& ln -sf /dev/stdout /var/log/php-fpm.log

EXPOSE 9000

CMD ["php-fpm","-F","-O","-R"]
