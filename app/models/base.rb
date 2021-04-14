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
class Base < ApplicationRecord
    has_and_belongs_to_many :tests
end
