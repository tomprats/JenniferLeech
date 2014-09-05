class Item < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates_presence_of :name, :price, :image

  mount_uploader :image, ItemImageUploader

  before_validation do
    self.price = 0 if self.price.blank?
  end
end
