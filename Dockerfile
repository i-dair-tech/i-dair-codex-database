FROM mysql:latest



VOLUME /var/lib/mysql
#

COPY  src/*.sql /docker-entrypoint-initdb.d/
