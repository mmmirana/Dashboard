# 指定基础镜像
FROM openjdk:8-jre
# 指定维护者信息
MAINTAINER "mmmirana<18166748035@163.com>"
# 指定label
LABEL app.name="springboot_dashboard"
LABEL app.version="1.0"

# 指定加载app.jar的位置
ENV APP_JAR_PATH=/mmmirana/application/app.jar

# 将上下文的jar放入指定位置
ARG JAR_FILE
ADD $JAR_FILE $APP_JAR_PATH

# 加载app.jar
ENTRYPOINT java -jar $APP_JAR_PATH