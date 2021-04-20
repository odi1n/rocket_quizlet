class AddRightCountToTestsReport < ActiveRecord::Migration[6.1]
    def change
        remove_column :tests, :right_count, :integer
        add_column :test_reports, :right_count, :integer
    end
end
