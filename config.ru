#!/usr/bin/env ruby

require 'rubygems'
require 'dunmanifestin/terminator'
require "active_support"
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/string'
require './twitter_shell'
require './stack_shell'

manifest = ->(dun){ dun.address(genre: './palettes/sophistry') }
duntweet = Terminator.new(shell: TwitterShell)
dunstack = Terminator.new(shell: StackShell)


loop { manifest[duntweet] }

app = Proc.new do
  manifest[dunstack]
  ['200', {'Content-Type' => 'text/html'}, [StackShell.get]]
end

run app
