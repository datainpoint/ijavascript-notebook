FROM jupyter/minimal-notebook:feacdbfc2e89

USER root
RUN apt-get update
RUN rm -rf /var/apt/lists/*
#RUN apt-get install -y curl
#RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y npm
USER jovyan
RUN npm install -g ijavascript # --unsafe-perm
RUN ijsinstall --spec-path=full
RUN npm install -g tslab@latest
RUN tslab install --python=python3
# Add nbgitpuller
RUN pip install nbgitpuller
