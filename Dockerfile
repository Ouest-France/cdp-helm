FROM ouestfrance/cdp-kubectl:1.6.7

ARG HELM_VERSION="v2.8.2"

RUN apk --update add tar gzip && \
    curl -L https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar zxv -C /bin/ --strip-components=1 linux-amd64/helm && \
    chmod +x /bin/helm && \
    apk del tar gzip && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENTRYPOINT ["helm"]
CMD ["--help"]
