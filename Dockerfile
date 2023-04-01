FROM ruby:3.1.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg \
    | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] \
    https://dl.yarnpkg.com/debian/ stable main" \
        | tee /etc/apt/sources.list.d/yarn.list > /dev/null \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn \
  && mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp



COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]