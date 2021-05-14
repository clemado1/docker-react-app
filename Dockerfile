# Builder Stage (node)

FROM node:alpine as builder

WORKDIR /usr/src/app

# dependencies cache
COPY package.json ./

# install dependencies
RUN npm install

COPY ./ ./

# 실행
CMD ["npm", "run", "build"]

# docker run -p 49160:8080 imagename
# docker run -d -p 5000:8080 -v /usr/src/app/node_modules -v $(pwd):/usr/src/app imagename


# Run Stage (nginx)

FROM nginx

EXPOSE 80

COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# docker run -p 8080:80 imagename