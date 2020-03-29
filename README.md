# org.openwms.configuration
A Spring Boot configuration service, built on top of Netflix Archaius.

![Build status][ci-image]

# Build and Run Locally
The easiest way to run the configuration server locally is in `native` mode without pointing to an external Git repository. This `native`
mode is just for sample purpose and not used in real life projects. In production the configuration server should always point to a Git
repository.

Locally:
```
$ ./mvnw package
$ java -Dspring.profiles.active=native -jar target/openwms-configuration.jar
```

For production:
```
$ ./mvnw package
$ java -Dspring.cloud.config.server.git.uri=https://github.com/spring-labs/org.openwms.zile -jar target/openwms-configuration.jar
```

# Run as Docker Container
The configuration server is also available on [Docker Hub](https://hub.docker.com/r/interface21/openwms-configuration) as pre-built Docker
image. Simply bootstrap a container and expose the internal port `8099` of the service:

```
docker run -p8099:8099 -d interface21/openwms-configuration:latest
```

# Release
A release and upload of this service can be done:
```
$ ./mvn clean deploy -Prelease,gpg
```

[ci-image]: https://img.shields.io/jenkins/s/http/openwms.mooo.com:8080/view/All/job/Spring%20Labs/job/org.openwms.configuration.svg
