FROM jenkins/jenkins:2.387.1-lts-jdk11
USER root
RUN apt-get update && apt-get install -y make git openjdk-11-jdk
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugins $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# docker build -t eduardo/jenkins:0.2.0 .

# docker images ps

# docker run -d \
#     -t \
#     -p 8080:8080 \
#     -v jenkins_home_2:/var/jenkins_home \
#     -v jenkins_backup_2:/srv/backup \
#     eduardo/jenkins:0.2.0

# docker ps
# docker logs <nome_image>