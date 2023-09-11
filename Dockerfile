FROM node:20-alpine
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
COPY nodejs-demo/src/ ./
RUN npm install
# Bundle app source
EXPOSE 3000
CMD [ "node", "server.js" ]