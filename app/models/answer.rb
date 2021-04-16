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
class Answer < Base
    validates :type, presence: true
    validates :text, presence: true
    validates_associated :tests
    validates_associated :questions
    validates_associated :question_answers

    has_many :question_answers, dependent: :destroy
    has_many :questions, through: :question_answers

    rails_admin do
        field :text
    end
end
