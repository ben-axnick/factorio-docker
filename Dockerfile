FROM ubuntu:14.04
RUN apt-get update && apt-get install -y curl
ENV FACTORIO_VERSION=0.12.26
RUN \
  curl -kL \
  "https://www.factorio.com/get-download/${FACTORIO_VERSION}/headless/linux64" \
  > /tmp/factorio.tar.gz
RUN \
  cd /tmp && \
  tar xzf factorio.tar.gz && \
  mv /tmp/factorio /opt/factorio &&\
  rm -Rf /tmp/*
VOLUME /opt/factorio/saves
WORKDIR /opt/factorio
ADD run.sh ./
ENTRYPOINT ["bash", "run.sh"]
CMD ["--help"]
EXPOSE 34197:34197/tcp 34197:34197/udp
