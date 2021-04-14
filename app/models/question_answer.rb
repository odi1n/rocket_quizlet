# == Schema Information
#
# Table name: question_answers
#
#  id                            :bigint           not null, primary key
#  is_correct(Проверка решен ли) :boolean          default(FALSE), not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  answer_id(Ответ)              :bigint           not null
#  question_id(Вопрос)           :bigint           not null
#
# Indexes
#
#  index_question_answers_on_answer_id    (answer_id)
#  index_question_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_id => bases.id)
#  fk_rails_...  (question_id => bases.id)
#
class QuestionAnswer < ApplicationRecord
  belongs_to :question, foreign_key: "question_id", class_name: "Question"
  belongs_to :answer, foreign_key: "answer_id", class_name: "Answer"
end
