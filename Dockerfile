FROM maven:3.8.7 as build
COPY . .
RUN mvn -B clean package
FROM openjdk:17
COPY --from=build /target/*.jar  deploy.jar
ENTRYPOINT ["java", "-jar", "-Dserver.port=1908 ", "deploy.jar"]