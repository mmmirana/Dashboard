# 指定基础镜像
FROM openjdk:8-jre
# 指定维护者信息
MAINTAINER "mmmirana<18166748035@163.com>"
# 指定label
LABEL app.name="springboot_dashboard"
LABEL app.version="1.0"

# 获取app名称
ARG APP_NAME
# 获取<app>.jar名称
ARG APP_JAR_FILE

# 指定加载app.jar的位置
ENV APP_NAME=$APP_NAME
ENV APP_JAR_FILE=$APP_JAR_FILE
ENV ENTRY_APP_JAR_PATH=/mmmirana/application/$APP_NAME/$APP_JAR_FILE

RUN echo $ENTRY_APP_JAR_PATH

# 将上下文的jar放入指定位置
ADD target/$APP_JAR_FILE $ENTRY_APP_JAR_PATH

# 加载app.jar
ENTRYPOINT java -jar $ENTRY_APP_JAR_PATH
