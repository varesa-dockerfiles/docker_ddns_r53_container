FROM centos:latest
MAINTAINER Esa Varemo <esa@kuivanto.fi>

RUN yum update -y
RUN yum install -y git golang ruby wget

RUN curl -sSL https://get.docker.com/ | sh

RUN wget https://github.com/barnybug/cli53/releases/download/0.6.5/cli53-linux-386 -O /usr/local/bin/cli53
RUN chmod +x /usr/local/bin/cli53

RUN git clone https://github.com/varesa/docker_ddns_r53.git

WORKDIR /docker_ddns_r53/

CMD ["ruby", "docker_ddns"]
