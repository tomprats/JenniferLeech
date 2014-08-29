class Tag < ActiveRecord::Base
  has_and_belongs_to_many :items
  belongs_to :primary_item, class_name: "Item"

  validates_presence_of :name, :description
  validates_uniqueness_of :name

  def image
    primary_item.try(:image) || items.first.try(:image)
  end
end
