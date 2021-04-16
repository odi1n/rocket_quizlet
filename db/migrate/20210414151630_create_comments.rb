class CreateComments < ActiveRecord::Migration[6.1]
    def change
        create_table :comments do |t|
            t.references :commentable, polymorphic: true
            t.references :user, foreign_key: true, comment: "Пользователи"
            t.string :text, comment: "Текст комментария"
            t.timestamps
        end
    end
end
