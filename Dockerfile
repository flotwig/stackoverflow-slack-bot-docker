FROM node:latest

RUN apt-get update
RUN apt-get install git

RUN git clone https://github.com/ldez/stackoverflow-slack-bot.git /bot

WORKDIR /bot

RUN npm i

COPY ./run.sh /bot/run.sh

CMD ./run.sh
