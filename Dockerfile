FROM node:18-bullseye-slim

ENV YARN_CACHE_FOLDER=/cache/yarn
ENV API_URL=localhost:1337

WORKDIR /app

# install dependencies
COPY package.json yarn.lock ./
RUN --mount=type=cache,target=/cache/yarn \
    yarn install

# copy app source
COPY . ./

ENV VITE_HOST=0.0.0.0
ENV VITE_PORT=80
CMD ["yarn", "dev"]