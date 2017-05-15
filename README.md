# markdown2confluence-server


## Synopsis

Converts markdown to Atlassian confluence markup language.
Forked from https://github.com/jedi4ever/markdown2confluence. Previosly run as a cli-tool this fork implements the functionality as a rest server using Sinatra.

## Build locally

* gem install bundle
* bundle install --path vendor/bundle
* bundle exec rackup 

## Endpoints

* GET localhost:9292
* GET localhost:9292/ping
* PUT localhost:9292/markdown2confluence

## Usage
Take a look at the included script test-markdown.rb to know how to interact with server

## Test
Run:
* ruby test-markdown.rb

## Docker image from Dockerhub (prefered way of running the application)
* docker run -d -p 9292:9292 rogerw/markdown2confluence-server

## Build docker image locally
To build and start docker image locally:
* docker build -t markdown2confluence-server -f docker/Dockerfile .
* docker run -d -p 9292:9292 markdown2confluence-server
