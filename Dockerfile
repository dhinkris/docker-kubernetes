# base image
# set the version of node (e.g 9.4 or latest)
FROM node:latest as node

# set working directory
WORKDIR /app

# Bundle app source
COPY . .

# install and cache app dependencies
RUN npm install
RUN npm run build --prod

# Specify port
EXPOSE 3000

# start app
CMD ["npm", "start"]
