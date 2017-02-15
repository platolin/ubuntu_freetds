# 
#-------------------------------------------------------------------------- 
# Image Setup 
#-------------------------------------------------------------------------- 
#
FROM phusion/baseimage:latest 
MAINTAINER lin plato <lin.plato@gmail.com>
RUN DEBIAN_FRONTEND=noninteractive 
RUN locale-gen zh_TW.UTF-8
ENV LANGUAGE=zh_TW.UTF-8
ENV LC_ALL=zh_TW.UTF-8
ENV LC_CTYPE=UTF-8 
ENV LANG=zh_TW.UTF-8
ENV TERM xterm 
# 
#-------------------------------------------------------------------------- 
# Software's Installation 
#-------------------------------------------------------------------------- 
#install  freetds 
#RUN apt-get install unixodbc unixodbc-dev freetds-dev freetds-bin tdsodbc
# 
# Install "PHP Extentions", "libraries", "Software's" 
RUN apt-get update && \ 
	apt-get install -y --force-yes \ 
	php7.0-cli \ 
	php7.0-common \ 
	php7.0-curl \ 
	php7.0-json \ 
	php7.0-xml \ 
	php7.0-mbstring \ 
	php7.0-mcrypt \ 
	php7.0-mysql \ 
	php7.0-pgsql \ 
	php7.0-sqlite \ 
	php7.0-sqlite3 \ 
	php7.0-zip \ 
	php7.0-bcmath \ 
	php7.0-memcached \ 
	php7.0-gd \ 
	php7.0-sybase \
	pkg-config \ 
	php-dev \ 
	libcurl4-openssl-dev \ 
	libedit-dev \ 
	libssl-dev \ 
	libxml2-dev \ 
	xz-utils \ 
	libsqlite3-dev \ 
	sqlite3 \ 
	git \ 
	curl \ 
	vim \ 
	nano \ 
	postgresql-client \ 
	unixodbc \
	unixodbc-dev \
	freetds-dev \
	freetds-bin \
	tdsodbc 
#	&& apt-get clean 
#########################################	
RUN apt-get upgrade -y --force-yes 
RUN apt-get clean 
##################################### # Composer: ##################################### 
# Install composer and add its bin to the PATH. 
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

# Source the bash
RUN . ~/.bashrc
