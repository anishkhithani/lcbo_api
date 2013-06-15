require "json"
require "open-uri"

class HtmlGenerator

  def index(search_text) #searches database
    products = retreive_data("http://lcboapi.com/products?q=#{search_text}")

    print_header

    puts "<h1> All yo booze son </h1>"

    products.each do |product|
      puts "<div class = 'product'>"
        puts "<h2> #{product['name']} </h2>"
        puts "<img src= '#{product['image_thumb_url']}' class='product_img' />"
        puts "<ul class = 'product_data'>"
          puts "<li> #{product['id']}</li>"
          puts "<li> $#{format_price(product['regular_price_in_cents'])}</li>"
          if product['price_in_cents'] != product['regular_price_in_cents'] 
            puts "<li> On sale! $#{format_price(product['price_in_cents'])}</li>"
          end
          puts "<li> #{product['primary_category']}</li>"
          puts "<li> #{product['secondary_category']}</li>"
          puts "<li> #{product['package']}</li>"
          puts product[""]
          puts product[""]
        puts "</ul>"
      puts "</div>"
    end  
  end



  def show(product_id) #shows specific product all product info
    product = retreive_data("http://lcboapi.com/products/#{product_id}")
        print_header

    puts "<h1> This what you wanted? </h1>"

      puts "<div class = 'product'>"
        puts "<h2> #{product['name']} </h2>"
        puts "<img src= '#{product['image_thumb_url']}' class='product_img' />"
        puts "<ul class = 'product_data'>"
          puts "<li> #{product['id']}</li>"
          puts "<li> $#{format_price(product['regular_price_in_cents'])}</li>"
          if product['price_in_cents'] != product['regular_price_in_cents'] 
            puts "<li> On sale! $#{format_price(product['price_in_cents'])}</li>"
          end
          puts "<li> #{product['primary_category']}</li>"
          puts "<li> #{product['secondary_category']}</li>"
          puts "<li> #{product['package']}</li>"
          puts product[""]
          puts product[""]
        puts "</ul>"
      puts "</div>"
  end

  # def drunk
  # end


  def retreive_data(url)
    #retreives JSON-formatted text file from lcboapi.com and reads it
    raw_response = open(url).read

    #takes the JSON formatted text file and parses putting it in a ruby-readble file
    #this new file will be a hash>array>hash
    parsed_response = JSON.parse(raw_response)

    #goes into the first has to retreive the key "result" which houses all the product info details
    #each product is one index of an array, within each product the key/value pairs are product attributes
    result = parsed_response["result"]
  end

  def print_header
    puts "<!DOCTYPE html>"
    puts "<html>"
    puts "<head>"
    puts "<title> Dane's Dranky Dranks </title>"
    puts "<link type = 'css' rel='stylesheet' href='reset.css' />"
    puts "<link type = 'css' rel = 'stylesheet' href = 'style.css' />"
    puts "</head>"
    puts "<body>"
  end

  def print_footer
    puts "</body>"
    puts "</html>"
  end

  def format_price(cents_string)
    cents_string.to_f/100
  end
end


