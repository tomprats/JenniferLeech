class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :imgur_albums do |t|
      t.string :imgur_id
      t.string :link

      t.timestamps
    end

    add_column :tags, :imgur_album_id, :integer
  end
end
