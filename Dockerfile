FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get install nodejs npm
RUN npm install -g --unsafe-perm ijavascript
RUN ijsinstall --install=global
ENV SERVER_PORT 8888

EXPOSE $SERVER_PORT
USER jovyan
