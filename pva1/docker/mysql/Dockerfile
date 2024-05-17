FROM ubuntu/mysql
ENV MYSQL_ROOT_PASSWORD="root"
ENV MYSQL_DATABASE="grouping"
COPY . /
RUN /generate-db.sh