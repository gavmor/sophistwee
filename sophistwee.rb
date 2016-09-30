#!/usr/bin/env ruby

require 'rubygems'
require 'dunmanifestin/terminator'
require './twitter_shell'

dun = Terminator.new(shell: TwitterShell)

loop do
  dun.address genre: '/Users/gavin/Workspace/palettes/sophistry'
  # sleep 10
end

