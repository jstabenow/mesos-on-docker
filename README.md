# mesos-on-docker
testing with dockerised mesos 

```docker
FROM mesoscloud/mesos-slave:0.23.0-ubuntu-14.04

RUN apt-get update && \
    apt-get install unzip

CMD ["/usr/sbin/mesos-slave"]
````

Example to run:
```sh
docker run -d --name slave --net host --pid=host --privileged --restart always \
              -v /sys:/sys \
              -v /var/run/docker.sock:/var/run/docker.sock \
              -v /etc/mesos-slave:/etc/mesos-slave \
              -v /root:/root \
              -v /etc/mesos:/etc/mesos \
              -v /tmp/mesos:/tmp/mesos \
                mesoscloud/mesos-slave:0.23.0-ubuntu-14.04 \
                  --master="zk://10.11.12.13:2181,10.11.12.14:2181,10.11.12.15:2181/mesos" \
                  --ip="10.11.12.13" \
                  --hostname="slave1" \
                  --credential=/root/credentials \
                  --log_dir=/tmp/mesos
```
