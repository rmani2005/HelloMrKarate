#Docker file for building the image for Spring boot application
FROM maven:3.8-jdk-11 as maven_build
WORKDIR /app
VOLUME /tmp

COPY pom.xml .    
COPY src ./src

#RUN mvn clean package -Dmaven.test.skip && rm -r target

# To package the application
#COPY src ./src
RUN mvn clean package -Dmaven.test.skip

########run stage########
FROM openjdk:11
WORKDIR /app

COPY /target/*.jar /app/hello-karate-1.0.2-SNAPSHOT.jar

#run the app
ENV JAVA_OPTS ""
CMD [ "bash", "-c", "java ${JAVA_OPTS} -jar hello-karate-1.0.2-SNAPSHOT.jar"]
