FROM hexpm/elixir:1.10.4-erlang-23.2.1-alpine-3.12.1

# Install or update hex
# Install phoenix web framework
RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install hex phx_new 1.5.7 --force

ENV APP_HOME /app
WORKDIR $APP_HOME
# ENV PATH="/home/elixir/.mix:${PATH}"

# RUN addgroup -g 1000 elixir \
#   && adduser -u 1000 -G elixir -s /bin/sh -D elixir \
#   && chown -R elixir: $APP_HOME
# USER elixir

CMD ["mix", "phx.server"]
