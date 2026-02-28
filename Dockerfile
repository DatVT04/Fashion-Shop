FROM tomcat:10.1-jdk17-temurin AS build

WORKDIR /app

# Copy Java web project sources
# note: workspace directory is named "FashionShop" (no hyphen)
COPY FashionShop/ /app/

# Build WAR mà không phụ thuộc NetBeans/Ant tasks (CopyLibs, ...).
# Tomcat sẽ compile JSP ở runtime; ở đây chỉ cần compile Java sources và đóng gói WAR.
RUN set -eux; \
    mkdir -p /app/build/classes; \
    find /app/src/java -name "*.java" > /app/sources.txt; \
    javac \
      -encoding UTF-8 \
      -source 17 \
      -target 17 \
      -d /app/build/classes \
      -classpath "/usr/local/tomcat/lib/*:/app/web/WEB-INF/lib/*" \
      @/app/sources.txt; \
    mkdir -p /app/build/war; \
    cp -R /app/web/* /app/build/war/; \
    mkdir -p /app/build/war/WEB-INF/classes; \
    cp -R /app/build/classes/* /app/build/war/WEB-INF/classes/; \
    mkdir -p /app/dist; \
    (cd /app/build/war && jar -cf /app/dist/FashionShop.war .)

#
# Runtime stage: Tomcat
#
FROM tomcat:10.1-jdk17-temurin

WORKDIR /usr/local/tomcat

# Xoá các webapp mặc định
RUN rm -rf webapps/*

# Copy file WAR đã build và deploy làm ROOT
COPY --from=build /app/dist/FashionShop.war webapps/ROOT.war

EXPOSE 8080

# Lệnh chạy Tomcat
CMD ["catalina.sh", "run"]