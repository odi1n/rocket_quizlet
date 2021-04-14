class CreateJoinTableUserCategory < ActiveRecord::Migration[6.1]
    def change
        create_join_table :users, :categories do |t|
            t.index [:user_id, :category_id]
            # t.index [:category_id, :user_id]
        end
    end
end
