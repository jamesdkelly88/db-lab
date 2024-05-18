FROM debian

COPY ./source/FairCom*.tar.gz /tmp/faircomdb.tar.gz

RUN tar -xvzf /tmp/faircomdb.tar.gz -C / && mv /FairCom* /faircomdb && rm /tmp/faircomdb.tar.gz

WORKDIR /faircomdb/server

USER 500:500

ENTRYPOINT ["./faircom"]

EXPOSE 6597 8080

VOLUME /faircomdb/data