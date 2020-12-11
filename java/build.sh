#Build java base
DOCKER_IMAGE=sunshanpeng/jdk:8u261
REMOTE_DOCKER_IMAGE=registry.cn-hangzhou.aliyuncs.com/$DOCKER_IMAGE

docker build -t $DOCKER_IMAGE .
docker tag $DOCKER_IMAGE $REMOTE_DOCKER_IMAGE

echo "new tag $REMOTE_DOCKER_IMAGE"
echo "you can test with command: docker run --rm -it $DOCKER_IMAGE bash"
echo "you can push with command: docker push $REMOTE_DOCKER_IMAGE"
