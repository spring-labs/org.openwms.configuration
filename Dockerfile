FROM java:8-jre
VOLUME library
ADD target/openwms-configuration.jar app.jar
ENV JAVA_OPTS -Dspring.profiles.active=CLOUD
ENV spring.profiles.active CLOUD
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
