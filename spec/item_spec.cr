require "./spec_helper"

describe Alfred::Item do
  item = Alfred::Item.new

  it "should have no mods to begin with" do
    item.mods.should be_nil
  end

  it "should be able to have mods added" do
    item.add_mod(Alfred::ModKey::CMD, Alfred::Mod.new)
    mods = item.mods
    if mods.is_a? Hash(String, Alfred::Mod)
      mods.size.should eq(1)
    else
      fail "mods should be a Hash(String, Alfred::Mod), but is a #{mods.class}"
    end
  end
end

describe Alfred::ItemType do
  it "::Default.to_s should be 'default'" do
    Alfred::ItemType::Default.to_s.should eq("default")
  end

  it "::File.to_s should be 'file'" do
    Alfred::ItemType::File.to_s.should eq("file")
  end

  it "::FileSkipCheck.to_s should be 'file:skipcheck'" do
    Alfred::ItemType::FileSkipCheck.to_s.should eq("file:skipcheck")
  end
end
