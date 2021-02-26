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

  module Instructions
   def introductions
     puts 'Welcome to new_start. This CLi tool gathered articles from Dev.to based on the hashtag provided'
     puts 'If you want to quit, simple type (q) the next time you are prompted to enter a value'
     puts 'Please provide a hashtag to continue..'
     puts ''
   end

   def quit_message
     puts 'You have quit the scraper'
   end

   def invalid_entry
     puts 'Invalid entry, try again'
   end
  end
