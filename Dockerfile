FROM alpine:3.10

ARG HELM_VERSION="v3.0.0"

RUN apk --update add tar gzip curl ca-certificates && \
    curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar zxv -C /bin/ --strip-components=1 linux-amd64/helm && \
    chmod +x /bin/helm && \
    apk del tar gzip curl ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENTRYPOINT ["helm"]
CMD ["--help"]
