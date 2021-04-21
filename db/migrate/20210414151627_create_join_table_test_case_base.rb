class CreateJoinTableTestCaseBase < ActiveRecord::Migration[6.1]
  def change
    create_join_table :test_cases, :bases do |t|
      t.index [:test_case_id, :basis_id]
      # t.index [:basis_id, :test_case_id]
    end
  end
end
