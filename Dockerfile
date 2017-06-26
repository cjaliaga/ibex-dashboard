FROM node

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Workaround for https://github.com/npm/npm/issues/16892
# Running npm install as root blows up in a  --userns-remap
# environment.

COPY package.json /usr/src/app/

USER node

# Install app dependencies
RUN npm install yarn -g
RUN npm install

USER root

# Bundle app source
COPY . /usr/src/app

EXPOSE 4000
ENV PORT 4000

CMD [ "npm", "start" ]
