class CreateBases < ActiveRecord::Migration[6.1]
    def change
        create_table :bases do |t|
            t.string :type, comment: "Тип вопрос/ответ"
            t.string :text, comment: "Текст"
            t.timestamps
        end
    end
end
