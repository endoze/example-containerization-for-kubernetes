# define our base image to base this one off of
FROM ruby:3.1.2-alpine3.16

# install some dependencies we'll need for our container at runtime
RUN apk --update add --no-cache --virtual run-dependencies \
    build-base && \
    gem install rack:2.2.4 && \
    gem install puma:5.6.5

# copy our app.ru file into the filesystem of our image
COPY app.ru app.ru

EXPOSE 9292

# run our application via rackup
CMD ["rackup", "-o", "0.0.0.0", "app.ru"]
