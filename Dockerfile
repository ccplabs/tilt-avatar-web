FROM docker.io/node:16-bullseye-slim as builder

ENV YARN_CACHE_FOLDER=/cache/yarn
ENV API_URL=http://127.0.0.1:1337

WORKDIR /app

# install dependencies
COPY package.json yarn.lock ./

RUN yarn install

RUN yarn global add vite http-server

# copy app source
COPY . ./

RUN yarn build

# ENV VITE_HOST=0.0.0.0
# ENV VITE_PORT=8080
# CMD ["yarn", "dev"]

EXPOSE 8080
CMD [ "http-server", "dist" ]