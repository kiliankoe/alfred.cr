require "./spec_helper"

describe Alfred::ModKey do
  it "::Command.to_s should be 'cmd'" do
    Alfred::ModKey::Command.to_s.should eq("cmd")
  end

  it "::CMD.to_s should be 'cmd'" do
    Alfred::ModKey::CMD.to_s.should eq("cmd")
  end

  it "::Option.to_s should be 'alt'" do
    Alfred::ModKey::Option.to_s.should eq("alt")
  end

  it "::ALT.to_s should be 'alt'" do
    Alfred::ModKey::ALT.to_s.should eq("alt")
  end

  it "::Control.to_s should be 'ctrl'" do
    Alfred::ModKey::Control.to_s.should eq("ctrl")
  end

  it "::CTRL.to_s should be 'ctrl'" do
    Alfred::ModKey::CTRL.to_s.should eq("ctrl")
  end
end
