class CreateJoinTableTestsBases < ActiveRecord::Migration[6.1]
    def change
        create_join_table :tests, :bases do |t|
            t.index [:test_id, :basis_id]
            # t.index [:bases_id, :test_id]
        end
    end
end
