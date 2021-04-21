class TestCase < ApplicationRecord
  validates :title, presence: true

  belongs_to :category
  has_many :test_reports, dependent: :nullify, inverse_of: :test_case

  has_and_belongs_to_many :questions,
                          class_name: "Question",
                          foreign_key: "test_case_id",
                          association_foreign_key: "basis_id"

  rails_admin do
    field :title
    field :category
    field :questions
  end
end
