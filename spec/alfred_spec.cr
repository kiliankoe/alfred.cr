require "./spec_helper"

describe "Alfred#generate_json" do
  it "should return correct JSON for empty list" do
    Alfred.generate_json([] of Alfred::Item).should eq("{\"items\":[]}")
  end

  it "should return correct JSON for multiple items" do
    item1 = Alfred::Item.new do |i|
      i.title = "Simple Item 1"
    end
    item2 = Alfred::Item.new do |i|
      i.title = "Simple Item 2"
    end
    json = "{\"items\":[{\"title\":\"Simple Item 1\"},{\"title\":\"Simple Item 2\"}]}"
    Alfred.generate_json([item1, item2]).should eq(json)
  end

  it "should return correct JSON for item with icon" do
    item = Alfred::Item.new do |i|
      i.icon = Alfred::Icon.new do |icon|
        icon.type = Alfred::IconType::FileIcon.to_s
        icon.path = "~/Desktop"
      end
    end
    json = "{\"items\":[{\"title\":\"\",\"icon\":{\"type\":\"fileicon\",\"path\":\"~/Desktop\"}}]}"
    Alfred.generate_json(item).should eq(json)
  end

  it "should return correct JSON for item with modifiers" do
    item = Alfred::Item.new do |i|
      i.add_mod Alfred::ModKey::CMD, Alfred::Mod.new { |mod| mod.arg = "mod arg cmd" }
      i.add_mod Alfred::ModKey::ALT, Alfred::Mod.new { |mod| mod.arg = "mod arg alt" }
    end
    json = "{\"items\":[{\"title\":\"\",\"mods\":{\"cmd\":{\"valid\":true,\"arg\":\"mod arg cmd\"},\"alt\":{\"valid\":true,\"arg\":\"mod arg alt\"}}}]}"
    Alfred.generate_json(item).should eq(json)
  end

  it "should return correct JSON for item with type" do
    item = Alfred::Item.new do |i|
      i.type = Alfred::Type::File.to_s
    end
    json = "{\"items\":[{\"title\":\"\",\"type\":\"file\"}]}"
    Alfred.generate_json(item).should eq(json)
  end

  it "should return correct JSON for item with argument" do
    item = Alfred::Item.new do |i|
      i.arg = "some argument"
    end
    json = "{\"items\":[{\"title\":\"\",\"arg\":\"some argument\"}]}"
    Alfred.generate_json(item).should eq(json)
  end

  pending "should return correct JSON for item with complex argument" do
    item = Alfred::Item.new do |i|
      i.arg = Alfred::ComplexArg.new do |c|
        c.arg = "complex argument"
        c.variables = {"a" => "foo", "b" => "bar"}
      end
    end
    json = "{\"items\":[{\"title\":\"\",\"arg\":{\"alfredworkflow\":{\"arg\":\"complex argument\",\"variables\":{\"a\":\"foo\",\"b\":\"bar\"}}}}]}"
    Alfred.generate_json(item).should eq(json)
  end

  it "should return correct JSON for item with text" do
    item = Alfred::Item.new do |i|
      i.text = Alfred::Text.new do |t|
        t.copy = "copy text"
        t.largetype = "large type text"
      end
    end
    json = "{\"items\":[{\"title\":\"\",\"text\":{\"copy\":\"copy text\",\"largetype\":\"large type text\"}}]}"
    Alfred.generate_json(item).should eq(json)
  end
end

describe "Alfred#input" do
  it "should return empty string for no input" do
    Alfred.input.should eq("")
  end
end

describe "Alfred#debug" do
  it "should be false if debug flag is not set" do
    Alfred.debug.should eq(false)
  end

  it "should be true if debug flag is set" do
    ENV["debug"] = "1"
    Alfred.debug.should eq(true)
    ENV.delete("debug") # just in case
  end
end

# describe "Alfred#fetch" do
#   it "should return the body of the page" do
#     url = "https://httpbin.org/robots.txt"
#     response = "User-agent: *\nDisallow: /deny\n"
#     Alfred.fetch(url).should eq(response)
#   end
# end
