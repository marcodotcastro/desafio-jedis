FROM timbru31/ruby-node:2.7

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update && apt-get install -y yarn

# Install base deps or additional (e.g. tesseract)
ARG INSTALL_DEPENDENCIES
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends ${INSTALL_DEPENDENCIES} \
    build-essential libvips libpq-dev git libfreetype6-dev gsfonts libmagickwand-dev imagemagick \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

WORKDIR /app
COPY . .
RUN bundle install

# Install deps Tailwind
RUN rm -rf node_modules && npm install
RUN npm install esbuild

RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
RUN bin/rails tailwindcss:build

EXPOSE 3000