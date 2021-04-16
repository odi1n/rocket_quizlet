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

    has_many :question_answers, dependent: :destroy
    has_many :answers, through: :question_answers

    has_and_belongs_to_many :tests,
                            class_name: "Test",
                            foreign_key: "test_id",
                            association_foreign_key: "basis_id"
    rails_admin do
        field :text
        field :comment
        field :answers
    end
end
