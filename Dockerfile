FROM ruby:2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

VOLUME /var/www/app
EXPOSE 3000

WORKDIR /var/www/app
COPY Gemfile Gemfile.lock ./
RUN bundle update --jobs 20 --retry 5
COPY . ./

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]