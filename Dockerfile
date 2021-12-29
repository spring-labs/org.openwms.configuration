FROM openjdk:17.0.1-oracle
ARG JAVA_OPTS="-Xss512k"
ADD target/openwms-configuration-exec.jar app.jar
ENTRYPOINT exec java $JAVA_OPTS -jar /app.jar
