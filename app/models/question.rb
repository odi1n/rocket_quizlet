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
    has_many :question_answers, dependent: :destroy
    has_many :answers, through: :question_answers

    has_one :comment, as: :commentable
end
