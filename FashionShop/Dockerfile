# Use official Tomcat with OpenJDK 11
FROM tomcat:10.1-jdk17-openjdk

# Render exposes a port via the PORT env var; default to 8080 when not set
ENV PORT=9999

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy exploded WAR (built webapp) into Tomcat's ROOT
# Assumes the project build output is at build/web (contains WEB-INF, JSPs, libs, classes)
COPY build/web /usr/local/tomcat/webapps/ROOT

# Add entrypoint to rewrite Tomcat connector port from 8080 -> $PORT at container start
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose default Tomcat port (for documentation; Render provides $PORT)
EXPOSE 9999

# Start via entrypoint script which adjusts server.xml to respect $PORT
CMD ["/usr/local/bin/docker-entrypoint.sh"]
