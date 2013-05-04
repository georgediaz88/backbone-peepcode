class Video < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :image, :link, :title, :watched
  validates :title, uniqueness: true
end
