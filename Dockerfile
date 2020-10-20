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
RUN npm install -g tslab
#npm install -g itypescript && \
#its --ts-hide-undefined --install=global
#ENV HOME /root
#ENV SERVER_PORT 8888
#EXPOSE $SERVER_PORT
#CMD jupyter notebook --ip=* --port=$SERVER_PORT --no-browser --notebook-dir=$HOME --allow-root
