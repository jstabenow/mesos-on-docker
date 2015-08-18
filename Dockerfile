FROM mesoscloud/mesos-slave:0.23.0-ubuntu-14.04

RUN apt-get update && \
    apt-get install unzip

CMD ["/usr/bin/mesos"]
