FROM elixir:1.14.1

RUN apt-get update && \
 apt-get install -y inotify-tools -y postgresql-client

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.rebar --force
RUN mix local.hex --force &&  mix deps.get
RUN mix deps.compile

CMD ["/app/entrypoint.sh"]