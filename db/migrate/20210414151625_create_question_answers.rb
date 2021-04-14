class CreateQuestionAnswers < ActiveRecord::Migration[6.1]
    def change
        create_table :question_answers do |t|
            t.references :question, null: false, foreign_key: { to_table: 'bases' }, comment: "Вопрос"
            t.references :answer, null: false, foreign_key: { to_table: 'bases' }, comment: "Ответ"
            t.boolean :is_correct, null: false, default: false, comment: "Проверка решен ли"

            t.timestamps
        end
    end
end
