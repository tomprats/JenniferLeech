class Tag < ActiveRecord::Base
  has_and_belongs_to_many :items, after_add: :add_to_album, before_remove: :remove_from_album
  belongs_to :primary_item, class_name: "Item"
  belongs_to :imgur_album, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

#  after_create :create_album
#  after_update :update_album

  def image
    primary_item.try(:image) || items.first.try(:image)
  end

  def convert_to_imgur
    new_album = ImgurAlbum.create(
      name: self.name,
      description: self.description
    )
    update_attributes(imgur_album_id: new_album.id)
  end

  private
  def create_album
    new_album = ImgurAlbum.create(
      name: self.name,
      description: self.description
    )
    update_attributes(imgur_album_id: new_album.id)
  end

  def update_album
    self.imgur_album.update_attributes(
      name: self.name,
      description: self.description
    )
  end

  def add_to_album(item)
    item.imgur_image.imgur_id
  end

  def remove_from_album(item)
    item.imgur_image.imgur_id
  end
end
