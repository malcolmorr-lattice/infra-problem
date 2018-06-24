FROM tomcat:9.0.7-jre8-alpine

RUN ["rm", "-fr", "/usr/local/tomcat/webapps/ROOT"]
ADD companyNews.war /usr/local/tomcat/webapps/ROOT.war
RUN ls -la /usr/local/tomcat/webapps/*
ENV CATALINA_OPTS "-Xms512m -Xmx512m"
ENV JAVA_OPTS "-Dfile.encoding=UTF-8 -Dnet.sf.ehcache.skipUpdateCheck=true -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC"

EXPOSE 8080
