# == Schema Information
#
# Table name: tests
#
#  id                           :bigint           not null, primary key
#  right_count(Правильный счет) :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  category_id(Категории)       :bigint           not null
#
# Indexes
#
#  index_tests_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Test < ApplicationRecord
    belongs_to :category

    has_many :test_reports, dependent: :nullify
    has_and_belongs_to_many :questions,
                            class_name: "Question",
                            foreign_key: "test_id",
                            association_foreign_key: "basis_id"

    rails_admin do
        field :category
        field :questions
        field :right_count
    end
end
