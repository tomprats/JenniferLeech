class CreateImages < ActiveRecord::Migration
  def change
    create_table :imgur_images do |t|
      t.string :imgur_id
      t.string :link

      t.timestamps
    end

    add_column :items, :imgur_image_id, :integer
  end
end
