# app名称，与maven ${project.artifactId}一致
export APP_NAME=dashboard
# app版本，与maven ${project.version}一致
export APP_VERSION=1.1
# 部署docker时候要暴露给外界的端口号
export APP_PORT=8003
# 构建docker的镜像名称+tag
#export DOCKER_IMAGE_NAME=registry.cn-hangzhou.aliyuncs.com/docker_for_k8s/$APP_NAME:$APP_VERSION
export DOCKER_IMAGE_NAME=jenkins.springboot/$APP_NAME:$APP_VERSION

# 运行docker容器的应用名称
export DOCKER_CONTAINER_NAME="${APP_NAME}_${APP_PORT}"
echo "Jenkins Docker Image      :$DOCKER_IMAGE_NAME"
echo "Jenkins Docker Container  :$DOCKER_CONTAINER_NAME"

# 删除应用
docker rm -f $DOCKER_CONTAINER_NAME
# 删除镜像
docker rmi -f $DOCKER_IMAGE_NAME

# 构建镜像
docker build \
  --build-arg APP_NAME=dashboard \
  --build-arg APP_JAR_FILE=$APP_NAME-$APP_VERSION.jar \
  -t \
  $DOCKER_IMAGE_NAME .

# 运行容器
docker run \
 -it \
 -d \
 -p $APP_PORT:8080 \
 --name $DOCKER_CONTAINER_NAME \
 $DOCKER_IMAGE_NAME
