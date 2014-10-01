class ImgurImage < ActiveRecord::Base
  before_create :create_image
  before_update :update_image
  before_destroy :delete_image

  attr_accessor :name, :description, :image, :url

  private
  def create_image
    imgur_image = Imgur::Image.create(
      url: self.url,
      image: self.image,
      title: self.name,
      description: self.description
    )
    self.imgur_id = imgur_image["id"]
    self.link = imgur_image["link"]
  end

  def update_image
    Imgur::Image.update(
      imgur_id: self.imgur_id,
      title: self.name,
      description: self.description
    )
  end

  def delete_image
    Imgur::Image.delete(self.imgur_id)
  end
end
