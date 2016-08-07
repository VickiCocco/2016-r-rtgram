#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'pp'
require 'open3'

if ARGV.length < 1
  puts "usage: #{$0} yyyy mm dd yyyy mmm dd -v"
  exit
end

FILE = ARGV[0]

for i in 1..31 do
  date_str = sprintf(",%d,",i)
  filename = sprintf("%2.2d-%s\n", i, FILE)
  $stderr.printf("date_str:%s, filename:%s", date_str, filename)
  stdout, stderr, status = Open3.capture3(
	"head -1 " + FILE + " >" + filename)
  stdout, stderr, status = Open3.capture3(
	"grep " + date_str + " " + FILE + " >>" + filename)
  print stderr
end



