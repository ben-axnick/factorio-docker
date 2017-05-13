FROM ubuntu:16.04
RUN apt-get update && apt-get install -y unzip curl dnsutils
ENV FACTORIO_VERSION=0.15.10
RUN \
  curl -kL \
  "https://www.factorio.com/get-download/${FACTORIO_VERSION}/headless/linux64" \
  > /tmp/factorio.tar.xz
RUN apt-get install -y xz-utils
RUN \
  mkdir -p /opt && \
  cd /tmp && \
  tar xf factorio.tar.xz -C /opt && \
  rm -Rf /tmp/*
WORKDIR /opt/factorio
RUN mkdir -p /opt/factorio/saves
VOLUME /opt/factorio/saves
ADD run.sh .
EXPOSE 34197:34197/tcp 34197:34197/udp

ENTRYPOINT ["sh", "run.sh"]
CMD ["--help"]
