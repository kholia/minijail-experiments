FROM ubuntu:groovy
LABEL maintainer="cloud-security@elastic.co"

WORKDIR /

RUN apt-get update && apt-get install libcap2 -y

# Note: these paths must be protected
ADD ./minijail0 /
ADD ./libminijailpreload.so /lib
RUN chmod 500 /minijail0
RUN chmod 400 /lib/libminijailpreload.so
# Note: We need USERGROUPS_ENAB activated in /etc/login.defs
RUN useradd -r -u 1001 app-1
RUN useradd -r -u 1002 app-2

# Note: these paths must be protected
ADD ./init.sh /
RUN chmod 500 /init.sh
ADD ./app-1.sh /
RUN chmod 445 /app-1.sh
ADD ./app-2.sh /
RUN chmod 445 /app-2.sh
RUN chmod +x /app-1.sh && chmod +x /app-2.sh

# XXX
CMD /init.sh
