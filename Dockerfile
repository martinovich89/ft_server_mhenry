# OS
FROM debian:buster

# USER INFOS
MAINTAINER Martin Henry <mhenry@student.42.fr>

# ESSENTIALS
RUN apt update && \
	apt-get install -y wget && \
	apt-get install -y procps && \
	apt-get install -y vim

# EMP (nginx - mysql - php)
RUN apt-get install -y nginx && \
	apt-get install -y mariadb-server && \
	apt-get install -y php-fpm && \
	apt-get install -y php-mysql && \
	apt-get install -y php-mbstring php-gd php-zip

# Copy source files into container
COPY srcs/* /tmp/

# Start initialization script
CMD bash /tmp/init.sh
