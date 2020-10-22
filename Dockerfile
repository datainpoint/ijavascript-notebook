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
# !!! dirty trick !!!
# original PATH is
# /opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# move conda's path **at the end**
# so that python resolves in /usr/bin/python(2)
# but node is still found in conda
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/conda/bin"
USER jovyan
RUN npm install -g ijavascript
#RUN npm install -g tslab@latest
RUN npm install -g tslab 
RUN ijsinstall
RUN tslab install --python=python3
#RUN tslab install
# !!! and restore original PATH !!!
USER root
ENV PATH="/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# somehow node won't find stuff installed by npm, this band-aid will help
ENV NODE_PATH="/opt/conda/lib/node_modules/"
USER jovyan
# Add nbgitpuller
RUN pip install nbgitpuller
