FROM node:10-alpine

RUN apk add --update-cache alpine-sdk \
    python3-dev \
    python-dev \
    py-pip

RUN python3 -m pip install --upgrade pip && \
    python2 -m pip install --upgrade pip

RUN python2 -m pip install ipykernel && \
    python2 -m ipykernel install --user

RUN npm --unsafe-perm i -g ijavascript && \
    ijsinstall --install=global

ENV HOME /root
ENV SERVER_PORT 8888

EXPOSE $SERVER_PORT
