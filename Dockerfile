FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get update -y --no-install-recommends \
	file \
	libunwind-dev \
	fonts-dejavu \
	gfortran && \ 
	rm -rf /var/apt/lists/* && \
        apt-get clean -y 
#RUN apt-get install -y curl
#RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y npm
USER jovyan
RUN npm install -g --unsafe-perm ijavascript
RUN ijsinstall --spec-path=full
RUN npm install -g itypescript
RUN its --ts-hide-undefined --install=local
RUN npm install -g tslab
