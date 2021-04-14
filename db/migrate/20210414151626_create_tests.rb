class CreateTests < ActiveRecord::Migration[6.1]
    def change
        create_table :tests do |t|
            t.references :category, null: false, foreign_key: true, comment: "Категории"
            t.integer :right_count, comment: "Правильный счет"

            t.timestamps
        end
    end
end
