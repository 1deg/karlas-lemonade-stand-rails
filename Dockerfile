FROM ruby:2.7

#Set environment variables.
ENV RAILS_ENV=development
#Bundler_version is different than what is in the Ruby2.7 image, so have to set it here for the bundle install to work right
ENV BUNDLER_VERSION=2.4.4

#Install Node.  Using 14 since it runs in the Ruby2.7 container, newer versions won't run.
RUN apt update && apt install -y curl &&\
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - &&\
    apt update && apt install -y nodejs

#Copy gemfiles first for caching goodness
WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/

#Install the gems for caching goodness
RUN gem install bundler -v 2.4.4
RUN bundle install

#add app
ADD . /app/

#Open gun ports
EXPOSE 3000

#Start the thing
RUN rails db:create 
RUN rails db:migrate RAILS_ENV=development
RUN rails db:migrate RAILS_ENV=test
CMD rails server -b '0.0.0.0'