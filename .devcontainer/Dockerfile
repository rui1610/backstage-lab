FROM node:20.11.1

ENV APPNAME=ai-sandbox
ENV HOME_FOLDER=/workspaces/$APPNAME
WORKDIR $HOME_FOLDER
ENV TEMPFOLDER=/tmp/mytmp

# -------------------------------------------------------------------------------------------------
## Install necessary packages to donwload and install tools
# -------------------------------------------------------------------------------------------------
# Install Terraform CLI
RUN apt-get update && apt-get install -y gnupg software-properties-common build-essential make curl wget git python3 g++ postgresql yq
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
RUN export NODE_OPTIONS='--no-node-snapshot'
#RUN npm install isolated-vm

CMD ["bash"]
