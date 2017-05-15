require 'sinatra/base'
require 'sinatra/contrib/all'
require "sinatra/json"
require 'json'
require_relative 'lib/converter'

class Markdown2ConfluenceApp < Sinatra::Base
  register Sinatra::Contrib
    set :show_exceptions, false

    get '/' do
      json :version => '1.0', :description => 'reads markdown and returns confluence wiki format'
    end

    get '/ping' do
      200
    end

    put '/markdown2confluence' do
      request.body.rewind
      begin
        data = JSON.parse(request.body.read)
        Kramdown::Document.new(data['content']).to_confluence
      rescue StandardError => e
        raise e
      end
    end

    not_found do
      json :info => "What you're looking for is not here", :status_code => 404
    end

    error do
      json :error => 'The request could not be handled: ' + env['sinatra.error'].message 
    end

end


