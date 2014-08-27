class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :gallery_id
      t.string :name
      t.integer :price, default: 0
      t.string :description
      t.string :image
      t.boolean :for_sale, default: true;

      t.timestamps
    end
  end
end
