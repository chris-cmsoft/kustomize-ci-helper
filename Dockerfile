FROM alpine:3.9

RUN echo 'http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --update kubernetes ca-certificates \
    && apk add --no-cache --virtual .build-deps --update curl \
    && mkdir -p /root/.kube \
    && rm -rf /usr/bin/kubelet \
              /usr/bin/kubeadm \
              /usr/bin/kube-scheduler \
              /usr/bin/kube-proxy \
              /usr/bin/kube-controller-manager \
              /usr/bin/kube-apiserver \
              /usr/bin/hyperkube \
    && curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest | \
            grep browser_download | \
            grep linux | \
            cut -d '"' -f 4 | \
            xargs curl -O -L \
    && mv kustomize_*_linux_amd64 kustomize \
    && chmod u+x kustomize \
    && mv kustomize /usr/bin/kustomize \
    && apk del .build-deps
