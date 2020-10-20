FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get update
#RUN apt-get install -y curl
#RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y npm
USER jovyan
RUN npm install -g --unsafe-perm ijavascript
RUN ijsinstall --spec-path=full
RUN npm install -g --unsafe-perm itypescript
RUN its
RUN npm install -g tslab
