class StateTestToRequest < ActiveRecord::Migration[6.1]
    def change
        add_reference :requests, :test_report, foreign_key: true, null: true
        add_column :requests, :state, :integer, default: :pending, comment: "Тип"
    end
end
