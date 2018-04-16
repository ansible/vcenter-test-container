FROM golang:1.10.1

RUN apt-get update && \
    apt-get -y --no-install-recommends install python-dev python-pip python-setuptools python-wheel && \
    rm -rf /var/lib/apt/lists/*

ADD requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt
ADD flask_control.py /root/flask_control.py

RUN go get -d github.com/vmware/govmomi && \
    cd ${GOPATH}/src/github.com/vmware/govmomi && \
    git checkout dee49fa3694c5aff05e4b340b0686772f65c1fe1 && \
    go install github.com/vmware/govmomi/govc github.com/vmware/govmomi/vcsim

EXPOSE 5000 8989 443 80 8080

CMD ["/root/flask_control.py"]
