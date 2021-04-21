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
    validates :text, presence: true

    has_many :question_answers, dependent: :destroy
    has_many :questions, through: :question_answers

    rails_admin do
        object_label_method :get_name

        field :text
    end

    def get_name
        text
    end
end
