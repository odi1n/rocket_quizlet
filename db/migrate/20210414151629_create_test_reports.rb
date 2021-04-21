class CreateTestReports < ActiveRecord::Migration[6.1]
    def change
        create_table :test_reports do |t|
            t.references :test_cases, foreign_key: true, comment: "Связная с тестами"
            t.references :user, null: false, foreign_key: true, comment: "Пользователи"
            t.integer :state, default: :new, comment: "Тип прохождения"
            t.string :invite_token, comment: "Ссылка на репорт"
            t.integer :right_count, null: false, default: 0, comment: "Кол-во правильных ответов"

            t.timestamps
        end
    end
end
