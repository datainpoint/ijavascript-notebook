FROM jupyter/minimal-notebook:feacdbfc2e89

RUN conda install nodejs npm
#USER root
#RUN npm install -g --unsafe-perm ijavascript
#RUN ijsinstall --install=global
#ENV HOME /root
#ENV SERVER_PORT 8888
#EXPOSE $SERVER_PORT
#CMD jupyter notebook --ip=* --port=$SERVER_PORT --no-browser --notebook-dir=$HOME --allow-root
#USER $NB_USER
