# == Schema Information
#
# Table name: bases
#
#  id                     :bigint           not null, primary key
#  text(Текст)            :string
#  type(Тип вопрос/ответ) :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Question < Base
    validates :text, presence: true

    has_one :comment, as: :commentable
    accepts_nested_attributes_for :comment

    belongs_to :category

    has_many :question_answers, dependent: :destroy
    has_many :answers, through: :question_answers

    has_and_belongs_to_many :test_cases,
                            class_name: "TestCase",
                            foreign_key: "basis_id",
                            association_foreign_key: "test_case_id"
    rails_admin do
        object_label_method :get_name

        field :text
        field :comment
        field :category
        # field :question_answers
    end

    def get_name
        text
    end
end
