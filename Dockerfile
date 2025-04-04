FROM alpine:3.21

RUN apk update && \
    apk add --no-cache samba-client

CMD [ "/bin/sh" ]
