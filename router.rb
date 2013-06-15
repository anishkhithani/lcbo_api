require_relative "html_generator"

if ARGV.empty?
  puts "Usage: ruby router.rb [action]"
  puts "Actions include:"
  puts "index 'query'"
  puts "product 'product id'"
  #add more instructions

else
  action = ARGV[0]
  generator = HtmlGenerator.new

    if action == "index"
      search_text = ARGV[1]
      generator.index(search_text)

    elsif action == "show"
      product_id = ARGV[1]
      generator.show(product_id)
    end
end


      


