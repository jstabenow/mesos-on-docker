# mesos-on-docker
testing with dockerised mesos 

Image jstabenow/mesos:0.23.0
```docker
FROM mesoscloud/mesos-slave:0.23.0-ubuntu-14.04

RUN apt-get update && \
    apt-get install unzip

CMD ["/usr/bin/mesos"]
````

Example to run Mesos-Slave:
```sh
docker run -d --name slave --net host --pid=host --privileged --restart always \
              -v /sys:/sys \
              -v /var/run/docker.sock:/var/run/docker.sock \
              -v /root:/root \
              -v /tmp/mesos:/tmp/mesos \
                jstabenow/mesos:0.23.0 slave \
                  --master="zk://10.11.12.13:2181,10.11.12.14:2181,10.11.12.15:2181/mesos" \
                  --ip="10.11.12.13" \
                  --hostname="slave1" \
                  --credential=/root/credentials \
                  --log_dir=/tmp/mesos
```

Current problems:
Slave couldn't recover the old states => old running docker-tasks are orphans
```sh
--docker_kill_orphans="true"
I0818 08:06:23.975733 16042 state.cpp:672] Failed to find resources file '/tmp/mesos/meta/resources/resources.info'
I0818 08:06:23.975903 16042 state.cpp:79] Failed to find the latest slave from '/tmp/mesos/meta'
````
