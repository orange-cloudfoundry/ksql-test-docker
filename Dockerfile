FROM confluentinc/ksqldb-cli:0.28.2

USER root

RUN yum install -y jq


#Equivalent of COPY . /usr/src/kcat on original kcat Dockerfile
RUN curl -LO https://github.com/edenhill/kcat/archive/refs/tags/1.7.0.tar.gz; \
    tar fxvz 1.7.0.tar.gz; \
    chmod 777 kcat-1.7.0; \
    mv kcat-1.7.0 kcat

ENV BUILD_DEPS bash make gcc g++ cmake curl pkgconfig python perl bsd-compat-headers zlib-dev zstd-dev zstd-libs lz4-dev openssl-dev curl-dev

ENV RUN_DEPS libcurl lz4-libs zstd-libs ca-certificates

RUN echo Installing ; \
  apk add --no-cache --virtual .dev_pkgs $BUILD_DEPS $BUILD_DEPS_EXTRA && \
  apk add --no-cache $RUN_DEPS $RUN_DEPS_EXTRA && \
  echo Building && \
  cd kcat && \
  rm -rf tmp-bootstrap && \
  echo "Source versions:" && \
  grep ^github_download ./bootstrap.sh && \
  ./bootstrap.sh --no-install-deps --no-enable-static && \
  mv kcat /usr/bin/ && \
  echo Cleaning up && \
  cd / && \
  rm -rf kcat && \
  apk del .dev_pkgs && \
  rm -rf /var/cache/apk/*

RUN kcat -V

USER appuser