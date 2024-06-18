FROM eclipse-temurin:17-jdk-alpine AS base

FROM gradle:7.6.1-jdk17-alpine AS build
USER root
RUN mkdir /src
COPY . /src
WORKDIR /src
RUN gradle --no-daemon build

FROM base AS final
EXPOSE 8080 8082
RUN mkdir /app
RUN mkdir /data
VOLUME [ "/data" ]
RUN chown 1111:1111 /app
RUN chown 1111:1111 /data
COPY --from="build" --chown=1111:1111  /src/build/libs/CatGenerator-0.0.1-SNAPSHOT.jar /app/CatGenerator.jar
USER 1111:1111
ENV AWS_REGION eu-north-1
ENTRYPOINT ["java", "-jar", "/app/CatGenerator.jar"]
