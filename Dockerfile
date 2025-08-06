FROM node:18 AS build

RUN apt-get update
RUN apt-get install git

WORKDIR /bot

# https://stackoverflow.com/a/78674407/3474615
RUN git init \
    && git remote add origin https://github.com/ldez/stackoverflow-slack-bot.git \
    && git fetch origin df0c61c1a54d4ec69e1baabb85cdf1564378a66b \
    && git checkout FETCH_HEAD

RUN npm i

FROM node:18

COPY --from=build /bot /bot

COPY ./run.sh /bot/run.sh

CMD cd /bot && ./run.sh
