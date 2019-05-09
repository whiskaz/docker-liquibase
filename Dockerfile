FROM openjdk:8-jdk-alpine

ARG VERSION=3.6.1

LABEL maintainer "ferrari.marco@gmail.com"

RUN apk add --update \
  bash \
  curl \
  && rm -rf /var/cache/apk/*

ENV PATH $PATH:/liquibase

ENV LIQUIBASE_VERSION ${VERSION}

RUN mkdir -p /liquibase \
    && curl -L https://github.com/liquibase/liquibase/releases/download/liquibase-parent-${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}-bin.tar.gz \
    | tar xzC /liquibase

COPY ./lib /liquibase/lib/
