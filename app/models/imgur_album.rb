class ImgurAlbum < ActiveRecord::Base
  before_create :create_album
  before_update :update_album
  before_destroy :delete_album

  attr_accessor :name, :description, :image_ids

  def add_images(ids)
    Imgur::Album.add_images(
      imgur_id: self.imgur_id,
      ids: ids
    )
  end

  def remove_images(ids)
    Imgur::Album.remove_images(
      imgur_id: self.imgur_id,
      ids: ids
    )
  end

  private
  def create_album
    imgur_album = Imgur::Album.create(
      title: self.name,
      description: self.description
    )
    self.imgur_id = imgur_album["id"]
    self.link = imgur_album["link"]
  end

  def update_album
    Imgur::Album.update(
      imgur_id: self.imgur_id,
      ids: self.image_ids,
      title: self.name,
      description: self.description
    )
  end

  def delete_album
    Imgur::Album.delete(self.imgur_id)
  end
end
