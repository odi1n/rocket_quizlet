class CreateCategories < ActiveRecord::Migration[6.1]
    def change
        create_table :categories do |t|
            t.string :title, comment: "Название категории"
        end
    end
end
