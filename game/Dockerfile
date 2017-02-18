FROM ubuntu:16.04
RUN apt-get update && apt-get install -y unzip curl dnsutils
ENV FACTORIO_VERSION=0.14.22
RUN \
  curl -kL \
  "https://www.factorio.com/get-download/${FACTORIO_VERSION}/headless/linux64" \
  > /tmp/factorio.tar.gz
RUN \
  mkdir -p /opt && \
  cd /tmp && \
  tar xzf factorio.tar.gz -C /opt && \
  rm -Rf /tmp/*
WORKDIR /opt/factorio
VOLUME /opt/factorio/saves
ADD run.sh .
EXPOSE 34197:34197/tcp 34197:34197/udp

ENTRYPOINT ["sh", "run.sh"]
CMD ["--help"]
