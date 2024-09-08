FROM alpine:latest

RUN apk add --no-cache git openssh bash

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

COPY entrypoint.sh /entrypoint.sh
COPY fake_commits.sh /fake_commits.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
