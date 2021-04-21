class CreateTestCases < ActiveRecord::Migration[6.1]
  def change
    create_table :test_cases do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true, comment: "Категории"

      t.timestamps
    end
  end
end
