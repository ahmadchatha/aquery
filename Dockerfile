ARG OPENJDK_TAG=8u212
FROM openjdk:${OPENJDK_TAG}

ARG SBT_VERSION=1.2.8

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  apt-get install rlwrap && \
  sbt sbtVersion

WORKDIR /code
ADD . /code
COPY q /root/q

ENV PATH="$PATH:~/q/l64/"