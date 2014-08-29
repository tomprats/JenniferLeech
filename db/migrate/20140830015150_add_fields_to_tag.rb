class AddFieldsToTag < ActiveRecord::Migration
  def change
    add_column :tags, :primary_item_id, :integer
    add_column :tags, :description, :string
    drop_table :galleries
  end
end
