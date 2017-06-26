FROM node

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app

# Workaround for https://github.com/npm/npm/issues/16892
# Running npm install as root blows up in a  --userns-remap
# environment.

RUN chmod -R 777 /usr/src/app
     
USER node

# Install app dependencies
COPY package.json /usr/src/app/
RUN cd /usr/src/app \
&& npm install yarn \
&& npm install

USER root



EXPOSE 4000
ENV PORT 4000

CMD [ "npm", "start" ]
