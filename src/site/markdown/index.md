# OpenWMS.org Configuration Server
A Spring Boot configuration service, built on top of Netflix Archaius. The purpose of this service is to provide technical microservice
configuration centrally managed across the whole application. Furthermore, this set of configuration files can be kept in separate project
specific repositories to keep the configuration service project independent. It can be configured to push configuration changes directly
out to the certain services and trigger a configuration reload without the need to restart the downstream service.

# Build and Run Locally
The easiest way to run the configuration server locally is in `native` mode without pointing to an external Git repository. In this mode,
the server tries to resolve all configuration files locally, either from classpath or a file location. The server could also be configured
to fetch the configuration files at startup from a Git repository.

Build and run locally:
```
$ ./mvnw package
$ java -Dspring.profiles.active=native \ 
-Dspring.cloud.config.server.native.search-location=file://./myconf \
-jar target/openwms-configuration-exec.jar
```

In this example the configuration server will look for configuration files in a directory named "myconf" within the current directory.

Git Repository:
```
$ ./mvnw package
$ java -Dspring.cloud.config.server.git.uri=https://github.com/spring-labs/org.openwms.zile \
-jar target/openwms-configuration-exec.jar
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
$ ./mvn release:prepare
$ ./mvn release:perform
```

# Resources

[![Build status](https://github.com/spring-labs/org.openwms.configuration/actions/workflows/master-build.yml/badge.svg)](https://github.com/spring-labs/org.openwms.configuration/actions/workflows/master-build.yml)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Maven central](https://img.shields.io/maven-central/v/org.openwms/org.openwms.configuration)](https://search.maven.org/search?q=a:org.openwms.configuration)
[![Docker pulls](https://img.shields.io/docker/pulls/interface21/openwms-configuration)](https://hub.docker.com/r/interface21/openwms-configuration)
[![Join the chat at https://gitter.im/openwms/org.openwms](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/openwms/org.openwms?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
