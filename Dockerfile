FROM docker.io/node:lts-bullseye-slim

ENV YARN_CACHE_FOLDER=/cache/yarn
ENV API_URL=http://127.0.0.1:1337

WORKDIR /app

# install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# copy app source
COPY . ./

ENV VITE_HOST=0.0.0.0
ENV VITE_PORT=8080
CMD ["yarn", "dev"]