require "./spec_helper"

describe Alfred::IconType do
  it "::File.to_s should be nil" do
    Alfred::IconType::File.to_s.should be_nil
  end

  it "::FileIcon.to_s should be 'fileicon'" do
    Alfred::IconType::FileIcon.to_s.should eq("fileicon")
  end

  it "::FileType.to_s should be 'filetype'" do
    Alfred::IconType::FileType.to_s.should eq("filetype")
  end
end
