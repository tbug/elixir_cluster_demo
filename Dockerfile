FROM elixir:1.9.1-alpine AS build
WORKDIR /app
ENV MIX_ENV=prod
RUN mix local.hex --force \
    mix local.rebar --force
COPY deps mix.exs ./
RUN mix deps.compile
COPY . .
RUN mix release

FROM elixir:1.9.1-alpine
WORKDIR /app
COPY --from=build /app/_build/prod/rel/elixir_cluster_demo /app
CMD ["/app/bin/elixir_cluster_demo", "start"]
