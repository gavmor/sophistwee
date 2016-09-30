#!/usr/bin/env ruby

require 'rubygems'
require 'dunmanifestin/terminator'
require './twitter_shell'

YAML.load_file("sophistwee.yml").tap do |scrt|
  consumer_key scrt.fetch(:consumer_key)
  consumer_secret scrt.fetch(:consumer_secret)
  secret scrt.fetch(:access_token_secret)
  token scrt.fetch(:access_token)
end

dun = Terminator.new(shell: TwitterShell)
loop { dun.address genre: './palettes/sophistry' }

