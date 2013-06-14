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
          puts "<li> #{product['regular_price_in_cents']}</li>"
          if product['price_in_cents'] != product['regular_price_in_cents'] 
            puts "<li> On sale! #{product['price_in_cents']}</li>"
          else
          puts nil
          end
          puts product[""]
          puts product[""]
          puts product[""]
        puts "</ul>"
      puts "</div>"
    end  
  end



  # def product(product_id) #shows specific product all product info
  # end

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
    puts "Dane's Dranky Dranks"
    puts "<link type = 'css' rel='stylesheet' href='reset.css' />"
    puts "<link type = 'css' rel = 'stylesheet' href = 'style.css' />"
    puts "</head>"
    puts "<body>"
  end

  def print_footer
    puts "</body>"
    puts "</html>"
  end
end


