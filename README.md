# mesos-on-docker-on-coreos
testing with dockerised mesos on coreos

Req.:
CoreOS Alpha 774.0.0

Mesos-Image + unzip: 
```docker
FROM mesoscloud/mesos-slave:0.23.0-ubuntu-14.04

RUN apt-get update && \
    apt-get install unzip

CMD ["/usr/bin/mesos"]
````

Systemd-Files:
