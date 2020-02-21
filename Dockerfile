FROM ubuntu:18.04
LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)" \
      version.bedtools="2.29.2" \
      source.bedtools="https://github.com/arq5x/bedtools2/releases/tag/v2.29.2"

ENV BEDTOOLS_VERSION=2.29.2

RUN apt-get update -y \
    && apt-get install -y build-essential wget python python-pip
RUN apt-get install -y zlib1g-dev libbz2-dev liblzma-dev
RUN wget https://github.com/arq5x/bedtools2/releases/download/v${BEDTOOLS_VERSION}/bedtools-${BEDTOOLS_VERSION}.tar.gz \
    && tar -zxvf bedtools-${BEDTOOLS_VERSION}.tar.gz \
    && cd bedtools2 \
    && make \
    && cp ./bin/bedtools /usr/bin/

ENTRYPOINT ["bedtools"]
CMD ["-h"]
