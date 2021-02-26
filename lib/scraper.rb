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
   puts 'You have quit the new_start'
 end

 def invalid_entry
   puts 'Invalid entry, try again'
 end
end


class Scraper
 extend Instructions

 def self.get_input
   user_input = gets.chomp
   get_hashtag(user_input)
 end

 def self.get_hashtag(user_input)
   if user_input == 'q'
     quit_message
   elsif user_input.empty?
     invalid_entry
     get_input
   else
     scrape_data(user_input.to_s)
   end
 end

 def self.scrape_data(hashtag)
   puts "Scraped data for #{hashtag}"
   get_input
 end

 def self.scrape_data(hashtag)
    url = "https://dev.to/t/#{hashtag}"
    puts 'getting data ....'
    html = HTTParty.get(url)
    response = Nokogiri::HTML(html)
    info = []
    articles = response.css('.crayons-story__body')
    if articles.empty?
      puts "No article for for hashtag: #{hashtag}"
    else
      articles.each do |section|
        title_and_author = section.search('h2.crayons-story__title a', 'div.crayons-story__top p')
        info.push({
          title: title_and_author[0].text.gsub(/\n/, '').strip.gsub(/\s+/, ' '),
          author: title_and_author[1].text.gsub(/\n/, '').strip.gsub(/\s+/, ' ')
        })
      end
    end
    puts info
    get_input
  end


end


Scraper.introductions
Scraper.get_input
