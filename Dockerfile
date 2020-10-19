FROM jupyter/minimal-notebook:612aa5710bf9

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.
# Add nbgitpuller
RUN pip install nbgitpuller
# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.
USER root
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libzmq3-dev \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/*

ENV NODE_VERSION 8.0.0
ENV NODE_PACKAGE node-v$NODE_VERSION-linux-x64
RUN mkdir -p $HOME/.node-gyp
RUN wget -q https://nodejs.org/dist/v${NODE_VERSION}/${NODE_PACKAGE}.tar.xz \
    && tar xf ${NODE_PACKAGE}.tar.xz \
    && cp -R ${NODE_PACKAGE}/bin/* /usr/local/bin \
    && cp -R ${NODE_PACKAGE}/include/* /usr/local/include \
    && cp -R ${NODE_PACKAGE}/lib/* /usr/local/lib \
    && cp -R ${NODE_PACKAGE}/share/* /usr/local/share \
    && rm -r ${NODE_PACKAGE} \
    && rm ${NODE_PACKAGE}.tar.xz

# Install ijavascript as user jovyan
USER jovyan
ENV NODE_PATH /home/jovyan/node_modules
ENV PATH ${NODE_PATH}/.bin:${PATH}
RUN npm install --prefix /home/jovyan ijavascript
RUN ijs --ijs-install-kernel

# Modify startup script to run ijavascript
USER root
RUN printf "#!/bin/bash\n$(which ijs)\n" \
    > /usr/local/bin/start-notebook.sh

# Switch back to jovyan to avoid accidental container runs as root
USER jovyan

# additional packages could be installed here
#RUN npm install -g jsdom d3 ijavascript-plotly plotly-notebook-js
