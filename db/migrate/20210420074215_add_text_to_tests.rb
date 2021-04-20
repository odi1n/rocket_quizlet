class AddTextToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :title, :string
  end
end
