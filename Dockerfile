FROM jupyter/minimal-notebook:612aa5710bf9

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.
# Add nbgitpuller
RUN pip install nbgitpuller
# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.
USER root
RUN apt-get install nodejs npm
RUN npm install -g --unsafe-perm ijavascript
RUN ijsinstall --install=global
USER $NB_USER
