FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get update
RUN apt-get install -y gcc g++ make
RUN apt-get install -yq --no-install-recommends libzmq3-dev
RUN apt-get clean
#RUN rm -rf /var/apt/lists/*
#RUN apt-get install -y curl
#RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm
RUN npm install -g --unsafe-perm ijavascript
#RUN ijsinstall --install=global
RUN npm install -g tslab@latest
RUN tslab install
#RUN ijsinstall
USER jovyan
#RUN tslab install --python=python3
# Add nbgitpuller
RUN pip install nbgitpuller jupyter-resource-usage
RUN conda install rise
