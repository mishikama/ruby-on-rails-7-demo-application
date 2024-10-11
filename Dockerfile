# stage builder
FROM ruby:3.1.2-slim-bullseye AS builder
WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
    libpq-dev \
    build-essential

RUN gem install bundler

COPY ruby-app/Gemfile* .
RUN bundle install

# stage runner
FROM ruby:3.1.2-slim-bullseye AS runner
WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY ruby-app .

EXPOSE 3000
RUN chmod +x docker-start.sh
CMD ["./docker-start.sh"]