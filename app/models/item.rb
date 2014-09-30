class Item < ActiveRecord::Base
  has_and_belongs_to_many :tags, after_add: :add_to_album, before_remove: :remove_from_album
  belongs_to :imgur_image, dependent: :destroy

  validates_presence_of :name, :price, :image

#  after_create :create_image
#  after_update :update_image

  mount_uploader :image, ItemImageUploader

  before_validation do
    self.price = 0 if self.price.blank?
  end

  def convert_to_imgur
    new_image = ImgurImage.create(
      url: true,
      image: self.image.url,
      name: self.name,
      description: self.description
    )
    update_attributes(imgur_image_id: new_image.id)
  end

  private
  def create_image
    new_image = ImgurImage.create(
      image: self.image,
      name: self.name,
      description: self.description
    )
    update_attributes(imgur_image_id: new_image.id)
  end

  def update_image
    self.imgur_image.update_attributes(
      name: self.name,
      description: self.description
    )
  end

  def add_to_album(tag)
    tag.imgur_album.add_images([self.imgur_image.imgur_id])
  end

  def remove_from_album(tag)
    tag.imgur_album.remove_images([self.imgur_image.imgur_id])
  end
end
