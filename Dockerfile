# Light scala image
# Attention ! pure scala, no jdk, so doesn't support java code
# scala-jre8-alpine
# This Dockerfile has two required ARGs to determine which base image
# to use for the JRE and which scala version to install.
# reference
# https://www.journaldev.com/7456/download-install-scala-linux-unix-windows
# https://github.com/alpine-docker/git
# officiel scala binary
# https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz
# backup scala binary
# https://github.com/baocaifeng/light-scala/blob/master/scala-2.13.5.tgz

ARG OPENJDK_TAG=8u151-jre-alpine
FROM openjdk:${OPENJDK_TAG}

# Install scala
ARG SCALA_VERSION=2.13.5
ARG SCALA_HOME=/usr/share/scala

# NOTE: bash is used by scala/scalac scripts
RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash curl git && \
    mkdir "working" && \
    cd "working" && \
    # Download scala
    wget --no-verbose "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    cd ".." && \
    mkdir "${SCALA_HOME}" && \
    # rm "working/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "working/scala-${SCALA_VERSION}/bin" "working/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "working" && \
    echo "Done !"