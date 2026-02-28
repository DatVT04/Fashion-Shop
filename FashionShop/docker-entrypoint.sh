#!/bin/sh
set -e

# Use PORT env var (Render sets this). Default to 8080 if not provided.
PORT=${PORT:-9999}

# Replace the default HTTP connector port in Tomcat's server.xml
if [ -f /usr/local/tomcat/conf/server.xml ]; then
  sed -i "s/port=\"9999\"/port=\"${PORT}\"/g" /usr/local/tomcat/conf/server.xml
fi

# Start Tomcat
exec catalina.sh run
