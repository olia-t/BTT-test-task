FROM node:18
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
COPY nodeja-demo/src/ ./
RUN npm install
# Bundle app source
EXPOSE 3000
CMD [ "node", "server.js" ]