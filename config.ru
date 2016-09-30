#!/usr/bin/env ruby

require 'rubygems'
require 'dunmanifestin/terminator'
require "active_support"
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/string'
require './twitter_shell'

secrets = File.exists?("sophistwee.yml") ? YAML.load_file("sophistwee.yml") : ENV

HashWithIndifferentAccess.new(secrets).tap do |s|
  consumer_key s.fetch(:consumer_key)
  consumer_secret s.fetch(:consumer_secret)
  secret s.fetch(:access_token_secret)
  token s.fetch(:access_token)
end

dun = Terminator.new(shell: TwitterShell)
loop { dun.address genre: './palettes/sophistry' }

