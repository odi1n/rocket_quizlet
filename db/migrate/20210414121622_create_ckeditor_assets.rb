# frozen_string_literal: true

class CreateCkeditorAssets < ActiveRecord::Migration[5.2]
  def up
    create_table :ckeditor_assets do |t|
      t.jsonb :data_data
      t.string  :type, limit: 30

      # Uncomment it to save images dimensions, if your need it
      # t.integer :width
      # t.integer :height

      t.timestamps null: false
    end

    add_index :ckeditor_assets, :type
  end

  def down
    drop_table :ckeditor_assets
  end
end
