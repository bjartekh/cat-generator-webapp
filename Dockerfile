FROM eclipse-temurin:21-jdk-alpine AS base

FROM gradle:jdk21-alpine AS build
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
COPY --from="build" --chown=1111:1111  /src/build/libs/catgenerator-0.1-all.jar /app/CatGenerator.jar
USER 1111:1111
ENV AWS_REGION eu-north-1
ENTRYPOINT ["java", "-jar", "/app/CatGenerator.jar"]
