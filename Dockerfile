FROM node:10

WORKDIR /usr/src/app

# dependencies cache
COPY package.json ./

# install dependencies
RUN npm install

COPY ./ ./

# 실행
CMD ["node", "server.js"]

# docker run -p 49160:8080 imagename
# docker run -d -p 5000:8080 -v /usr/src/app/node_modules -v $(pwd):/usr/src/app imagename