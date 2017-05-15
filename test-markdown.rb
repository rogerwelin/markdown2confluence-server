#!/usr/bin/ruby
require 'json'
require 'httparty'

file = File.open('README.md').read
endpoint = "http://localhost:9292/markdown2confluence"

markdown_hash = Hash.new
markdown_hash[:content] = file

response = HTTParty.put(endpoint, :body => markdown_hash.to_json)
puts response.body
