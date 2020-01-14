# To compile this image manually run:
#
# $ make docker
FROM alpine:3.10

RUN apk add -U --no-cache ca-certificates

FROM scratch

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY releaser-test /usr/bin/releaser-test

USER 1000

ENTRYPOINT ["releaser-test"]
