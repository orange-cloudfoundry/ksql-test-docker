FROM edenhill/kcat:1.7.1

USER root

RUN apk add jq


RUN kcat -V

USER appuser