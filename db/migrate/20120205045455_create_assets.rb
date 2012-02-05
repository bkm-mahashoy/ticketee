class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at
      t.integer :ticket_id

      t.timestamps
    end

    [:asset_file_name,
     :asset_content_type,
     :asset_file_size,
     :asset_updated_at].each do |column|
      remove_column :tickets, column
    end
  end
end
