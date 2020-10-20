FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
USER jovyan
RUN npm install -g --unsafe-perm ijavascript
RUN ijsinstall --spec-path=full
RUN npm install jp-kernel
RUN npm install -g itypescript
RUN its
RUN npm install -g tslab
