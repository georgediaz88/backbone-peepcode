require "spec_helper"

describe Video do
  it "should not allow dupes" do
    @video1 = Video.create(link: "gdiaz.com")
    @video2 = Video.create(link: "gdiaz.com")
    Video.all.count.should == 1
  end
end