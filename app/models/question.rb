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
    validates :type, presence: true
    validates :text, presence: true
    validates_associated :tests
    validates_associated :question_answers
    validates_associated :answers


    has_one :comment, as: :commentable

    has_many :question_answers, dependent: :destroy
    has_many :answers, through: :question_answers

end
