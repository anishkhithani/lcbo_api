require "json"
require "open-uri"

class HtmlGenerator

  def index(search_text) #searches database
    products = ######## ("http://lcboapi.com/products?q=#{seach_text}")
  end

  def product(product_id) #shows specific product all product info
  end

  def drunk
  end
























  def retreive_data(url)
    #retreives JSON-formatted text file from lcboapi.com and reads it
    raw_response = open(url).read

    #takes the JSON formatted text file and parses putting it in a ruby-readble file
    #this new file will be a hash>array>hash
    parsed_response = JSON.parse(raw_response)
  end

  def print_header
    puts "<html>"
    puts "<head>"
    puts "Dane's Dranky Dranks"
    puts "<link type = "css" rel="stylesheet" href="reset.css" />"
    puts "<link type = "css" rel = "stylesheet" href = "style.css" />"
    puts "</head>"


