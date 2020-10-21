#FROM jupyter/minimal-notebook:feacdbfc2e89

#USER root
#RUN apt-get update
#RUN apt-get install -y gcc g++ make
#RUN rm -rf /var/apt/lists/*
#RUN apt-get install -y curl
#RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm
# !!! dirty trick !!!
# original PATH is
# /opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# move conda's path **at the end**
# so that python resolves in /usr/bin/python(2)
# but node is still found in conda
#ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/conda/bin"
#USER jovyan
#RUN npm install -g ijavascript # --unsafe-perm
#RUN ijsinstall # --spec-path=full
# !!! and restore original PATH !!!
#ENV PATH="/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# somehow node won't find stuff installed by npm, this band-aid will help
#ENV NODE_PATH="/opt/conda/lib/node_modules/"
#RUN npm install -g tslab@latest
#RUN tslab install --python=python3
FROM node:latest
USER root
RUN apt-get update && \
    apt-get install -yq --no-install-recommends libzmq3-dev jupyter-notebook && \
    apt-get clean
RUN mkdir -p ijavascript
COPY . ijavascript
RUN cd ijavascript && rm -rf node_modules && npm i --production
WORKDIR ijavascript
CMD npm install && npm run test
USER jovyan
# Add nbgitpuller
RUN pip install nbgitpuller
