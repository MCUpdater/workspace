FROM alpine:3.10
LABEL maintainer="allaryin@gmail.com"

ARG OPEN_JFX_URL=https://chriswhocodes.com/downloads/openjfx-8u60-sdk-overlay-linux-amd64.zip

WORKDIR mcu

COPY gradle/* gradle/
COPY *.gradle gradlew gradle.* ./

RUN apk update \
	&& apk add openjdk8 unzip git bash dos2unix
RUN ls && pwd
RUN dos2unix gradlew && bash gradlew setupWorkspace

#RUN set -e; \
#    curl $OPEN_JFX_URL -O openjfx.zip; \
#    unzip openjfx.zip -d openjfx; \
#    rm openjfx.zip
