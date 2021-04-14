class CreateRequests < ActiveRecord::Migration[6.1]
    def change
        create_table :requests do |t|
            t.references :user, null: false, foreign_key: true, comment: "Пользователи"
            t.references :category, null: false, foreign_key: true, comment: "Категории"

            t.timestamps
        end
    end
end
