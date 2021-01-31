FROM alpine:3.13

EXPOSE 80/tcp 12321/tcp

RUN apk update && \
  apk upgrade --no-cache && \
  apk add --no-cache tar

WORKDIR /opt/urbit

COPY linux64.tgz .

RUN tar zxvf ./linux64.tgz --strip=1 && \
    rm linux64.tgz

ENTRYPOINT ["./urbit"]
CMD ["-c", "comet"]
