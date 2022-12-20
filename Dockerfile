FROM confluentinc/ksqldb-cli:0.28.2

USER root

RUN yum install -y jq

ADD confluent.repo .

RUN dnf install -y 'dnf-command(copr)'; \
    dnf update -y


RUN dnf copr enable -y bvn13/kcat mageia-8-x86_64;  \
    rpm --import https://packages.confluent.io/rpm/7.3/archive.key; \
    mv confluent.repo /etc/yum.repos.d/confluent.repo; \
    yum update -y; \
    yum install librdkafka-devel; \
    dnf update -y; \
    dnf install -y kcat

RUN kcat -V

USER appuser