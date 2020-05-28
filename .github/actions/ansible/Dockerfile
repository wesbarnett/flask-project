FROM alpine 

RUN apk add ansible gcc python3-dev libc-dev libffi-dev openssl-dev
RUN pip3 install --upgrade paramiko
COPY entrypoint /entrypoint

ENTRYPOINT ["/entrypoint"]
