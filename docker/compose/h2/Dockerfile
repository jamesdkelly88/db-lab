# based on nemerosa/h2

FROM eclipse-temurin:23-jre-alpine
# TODO: renovate version for h2 maven
EXPOSE 8082
EXPOSE 9082

# Volume containing the H2 data
VOLUME /usr/lib/h2

# H2 version
ENV H2_VERSION="2.3.232"

# Download
ADD "https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar" /var/lib/h2/h2.jar

# Startup script
COPY run.sh /var/lib/h2/

# Rights
RUN chmod u+x /var/lib/h2/run.sh

# Java options
ENV JAVA_OPTIONS=""

# Additional H2 options
ENV H2_OPTIONS=""

# Entry point
ENTRYPOINT ["/var/lib/h2/run.sh"]