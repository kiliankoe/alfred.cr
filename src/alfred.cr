require "./alfred/*"
require "json"
require "http/client"

module Alfred
  def self.input
    ARGV.size > 0 ? ARGV[0] : ""
  end

  def self.generate_json(items : Array(Item))
    json = String.build do |io|
      io.json_object do |object|
        object.field "items" do
          io.json_array do |array|
            items.each { |item| array << item }
          end
        end
      end
    end
  end

  def self.output(items : Array(Item))
    puts generate_json items
  end

  def self.log(text : String)
    puts text if debug
  end

  def self.error(err : String)
    item = Item.new do |i|
      i.title = "Error: #{err}"
      i.subtitle = "Press ⌘L to see the full error and ⌘C to copy it."

      i.text = Text.new do |t|
        t.copy = err
        t.largetype = err
      end
    end

    output item
  end

  def self.fetch(url : String)
    response = HTTP::Client.get url
    response.body
  end

  def self.debug : Bool
    ENV.has_key?("debug")
  end

  # Helper overload for single items
  def self.generate_json(item : Item)
    generate_json [item]
  end

  # Helper overload for single items
  def self.output(item : Item)
    output [item]
  end
end
