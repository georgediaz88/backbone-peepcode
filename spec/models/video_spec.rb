require "spec_helper"

describe Video do
  it "should not allow dupes" do
    @video1 = Video.create(title: "Georgio")
    @video2 = Video.create(title: "Georgio")
    Video.all.count.should == 1
  end
end