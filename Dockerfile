FROM node:6.11.0

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install yarn -g
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080
ENV PORT 8080

CMD [ "npm", "start" ]
