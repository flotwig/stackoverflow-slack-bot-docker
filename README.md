# stackoverflow-slack-bot-docker

A wrapper for [`stackoverflow-slack-bot`][stackoverflow-slack-bot] to automatically post new activity for a tag on StackOverflow to a Slack channel.

Docker Hub: https://hub.docker.com/r/flotwig/stackoverflow-slack-bot

## Available Env Vars

* `SO_INTERVAL` - Number of seconds to wait between requests to StackOverflow. With a `slack.token`, this can be as low as `15`. Without it, it needs to be higher (max quota is 300/day without a token). Default: `900` (15 minutes)

## Available Volumes

* `/bot/config.json` - A `config.json` file as described in the [`stackoverflow-slack-bot` README][stackoverflow-slack-bot].

## Sample `docker run`

```shell
docker --restart=always \
  -e SO_INTERVAL=900 \
  -v /my/config.json:/bot/config.json
  flotwig/stackoverflow-slack-bot:latest
```

## Sample `docker-compose.yml`

```yml
  stackoverflow-slack-bot:
    image: 'flotwig/stackoverflow-slack-bot:latest'
    restart: always
    volumes:
    - /my/config.json:/bot/config.json
    environment:
    - SO_INTERVAL=900
```

[stackoverflow-slack-bot]: https://github.com/ldez/stackoverflow-slack-bot
