class Video < ActiveRecord::Base
  attr_accessible :image, :link, :title, :watched
  validates :title, uniqueness: true
end
