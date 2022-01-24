#!/bin/env ruby

require_relative './lib/program'

if ARGV.empty?
  puts 'Usage: ruby main.rb <order-file>'
  exit 1
end

path = ARGV.first

begin
  Program.run(path)
rescue Errno::ENOENT => e
  puts "Error: Cannot read '#{path}', please check again to make sure the file exists and has read permission"
end