FROM golang:1.10.1-alpine3.7

ARG GOVMOMI_CHECKOUT=dee49fa3694c5aff05e4b340b0686772f65c1fe1

ADD requirements.txt /root/requirements.txt

RUN apk add --no-cache build-base git linux-headers python python-dev py-pip py-setuptools && \
    pip install -r /root/requirements.txt && \
    go get -d github.com/vmware/govmomi && \
    cd ${GOPATH}/src/github.com/vmware/govmomi && \
    git checkout ${GOVMOMI_CHECKOUT} && \
    go install github.com/vmware/govmomi/govc github.com/vmware/govmomi/vcsim && \
    apk del build-base git linux-headers python-dev py-pip py-setuptools

ADD flask_control.py /root/flask_control.py

EXPOSE 5000 8989 443 80 8080
CMD ["/root/flask_control.py"]
