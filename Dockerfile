FROM alpine:3.24

RUN apk add --no-cache samba-client

CMD [ "/bin/sh" ]
