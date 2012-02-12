class AddUniqueIndexTagsName < ActiveRecord::Migration
  def up
    add_index :tags, :name, unique: true
  end

  def down
    remove_index :tags, :name
  end
end
