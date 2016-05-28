FROM bitwalker/alpine-erlang:latest

ENV REFRESHED_AT=2016-03-26 \
    HOME=/opt/app/ \
    # Set this so that CTRL+G works properly
    TERM=xterm

# Install Elixir
RUN \
    apk --no-cache --update add \
      git make g++ wget curl erlang-eunit postgresql\
      musl=1.1.14-r9 \
      elixir \
      nodejs && \
    npm install npm -g --no-progress && \
    update-ca-certificates --fresh && \
    rm -rf /var/cache/apk/*

# Add local node module binaries to PATH
ENV PATH ./node_modules/.bin:$PATH

# Install Hex+Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /opt/app

# Set exposed ports
EXPOSE 5000
ENV PORT=5000 MIX_ENV=prod

# Cache npm deps
ADD package.json package.json
RUN npm install

# Same with elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .

# Run frontend build, compile, and digest assets
RUN brunch build --production && \
    mix do compile, phoenix.digest

RUN chown default -R .

USER default


CMD ["mix", "phoenix.server"]
