FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
	file \
	libunwind-dev \
	fonts-dejavu \
	gfortran && \ 
	rm -rf /var/apt/lists/* && \
        apt-get clean -y
USER $NB_USER
RUN npm install -g chalk \
      date-fns \
      express \
      @babel/core @babel/cli @babel/preset-env \
      http-server \
      mathjs \
      moment \
      ramda \
      request \
      js-beautify \
      webpack webpack-cli && \
    npm install -g ijavascript && \
    ijsinstall && \
    npm install -g itypescript && \
    its --ts-hide-undefined --install=local
#RUN npm install -g --unsafe-perm ijavascript
#RUN ijsinstall --install=global
#ENV HOME /root
#ENV SERVER_PORT 8888
#EXPOSE $SERVER_PORT
#CMD jupyter notebook --ip=* --port=$SERVER_PORT --no-browser --notebook-dir=$HOME --allow-root
#USER $NB_USER
