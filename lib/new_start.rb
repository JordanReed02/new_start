#!/usr/bin/env ruby
require 'HTTParty'
require 'Nokogiri'

require 'optparse'
options = {}
OptionParser.new do |parser|
    parser.on("-n", "--name NAME", "The name of the person") do |value|
        options[:name] = value
    end
  end.parse!
 if options[:name]
     puts 'hello ' + options[:name]
  else
    puts 'hello stranger'
  end
