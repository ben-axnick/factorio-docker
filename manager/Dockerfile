FROM elixir:1.2.4
RUN mix local.hex --force && mix local.rebar --force
WORKDIR /app
ADD app/mix.exs /app
RUN mix deps.get && mix compile
ADD app/ /app/
RUN mix compile
ENTRYPOINT ["mix", "run", "--no-halt", "driver.exs"]
