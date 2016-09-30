#!/usr/bin/env ruby

require 'rubygems'
require 'dunmanifestin/terminator'
require './twitter_shell'

secrets = File.exists?("sophistwee.yml") ? YAML.load_file("sophistwee.yml") : ENV

secrets.tap do |s|
  consumer_key s.fetch(:consumer_key)
  consumer_secret s.fetch(:consumer_secret)
  secret s.fetch(:access_token_secret)
  token s.fetch(:access_token)
end

dun = Terminator.new(shell: TwitterShell)
loop { dun.address genre: './palettes/sophistry' }

