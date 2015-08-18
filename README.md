# mesos-on-docker
testing with dockerised mesos 

Image jstabenow/mesos:0.23.0
```docker
FROM mesoscloud/mesos-slave:0.23.0-ubuntu-14.04

RUN apt-get update && \
    apt-get install unzip

CMD ["/usr/bin/mesos"]
````

Default ENV ([here](https://hub.docker.com/r/mesoscloud/mesos-slave/~/dockerfile/)):
```sh
ENV MESOS_WORK_DIR /tmp/mesos
ENV MESOS_CONTAINERIZERS docker,mesos
ENV MESOS_EXECUTOR_REGISTRATION_TIMEOUT 5mins
```

Example to run Mesos-Slave:
```sh
docker run -d --name slave --net host --pid host --privileged --restart always \
              -v /sys/fs/cgroup:/sys/fs/cgroup \
              -v /var/run/docker.sock:/var/run/docker.sock \
              -v /tmp/mesos:/tmp/mesos \
              -v /root:/root \
                jstabenow/mesos:0.23.0 slave \
                  --master="zk://10.11.12.13:2181,10.11.12.14:2181,10.11.12.15:2181/mesos" \
                  --ip="10.11.12.13" \
                  --hostname="slave1" \
                  --log_dir=/tmp/mesos
                  --credential=/root/credentials \
```

FAQ:
- ``docker stop/start/restart`` work - kill and run again couldn't recover the old states
