FROM openjdk:8-jdk-alpine
VOLUME /library
ADD target/openwms-configuration.jar app.jar
RUN bash -c 'touch /app.jar'
ENV JAVA_OPTS="-XX:+UseSerialGC -Xss512k"
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-noverify -XX:+UseSerialGC -Xss512k","-jar","/app.jar"]
