1. 删除全部镜像： docker rmi - f $(docker images - qa)
2. docker logs - t - f--tail 3 containerids
3. docker commit - a = "aa" - m = "tomcat without docs"
containerid tomcat: 1.2
4. docker rm - f $(docker ps - q)
5. docker build - f / mydata / Dockerfile - t mytomcat.

6. FORM, RUN, EXPOSE, WORKDIR, ENV, ADD, COPY, VOLUME, CMD, ENTRYPOINT, ONBUILD

5. docker redis:
    docker run - p 6379: 6379\ -
    v / myredis / data: /data \ -
v myredis / conf / RadioNodeList.conf: /usr/local / etc / redis / redis.conf -
    d redis: 3.2 redis - server / usr / local / etc / redis / redis.conf
    --appendonly yes
docker exec - it containerid redis - cli