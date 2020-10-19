FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get update
RUN apt-get install -y nodejs npm
USER jovyan
#RUN npm install -gijavascript && \
#    ijsinstall && \
#    npm install -g itypescript && \
#    its --ts-hide-undefined --install=local
#RUN npm install -g --unsafe-perm ijavascript
#RUN ijsinstall --install=global
#ENV HOME /root
#ENV SERVER_PORT 8888
#EXPOSE $SERVER_PORT
#CMD jupyter notebook --ip=* --port=$SERVER_PORT --no-browser --notebook-dir=$HOME --allow-root
#USER $NB_USER
