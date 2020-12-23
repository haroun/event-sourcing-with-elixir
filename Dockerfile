FROM elixir:1.10.4-alpine

ENV APP_HOME /app
WORKDIR $APP_HOME

RUN addgroup -g 1000 elixir \
  && adduser -u 1000 -G elixir -s /bin/sh -D elixir \
  && chown -R elixir: $APP_HOME
USER elixir

# Install or update hex
# Install phoenix web framework
RUN mix local.hex --force \
  && mix archive.install hex phx_new 1.5.7 --force \
  && mix local.rebar --force

CMD ["mix", "phx.server"]
