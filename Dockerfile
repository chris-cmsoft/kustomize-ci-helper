FROM alpine:3.9

RUN echo 'http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --update kubernetes ca-certificates \
    && mkdir -p /root/.kube \
    && rm -rf /usr/bin/kubelet \
              /usr/bin/kubeadm \
              /usr/bin/kube-scheduler \
              /usr/bin/kube-proxy \
              /usr/bin/kube-controller-manager \
              /usr/bin/kube-apiserver \
              /usr/bin/hyperkube
