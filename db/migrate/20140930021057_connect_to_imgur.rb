class ConnectToImgur < ActiveRecord::Migration
  def up
    Item.all.each do |item|
      item.convert_to_imgur
    end
    Tag.all.each do |tag|
      tag.convert_to_imgur
      tag.items.each do |item|
        item.send(:add_to_album, tag)
      end
    end
  end

  def down
    ImgurImage.destroy_all
    ImgurAlbum.destroy_all
  end
end
