# == Schema Information
#
# Table name: test_reports
#
#  id                             :bigint           not null, primary key
#  invite_token(Ссылка на репорт) :string
#  state(Тип прохождения)         :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  test_id(Связная с тестами)     :bigint           not null
#  user_id(Пользователи)          :bigint           not null
#
# Indexes
#
#  index_test_reports_on_test_id  (test_id)
#  index_test_reports_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#  fk_rails_...  (user_id => users.id)
#
class TestReport < ApplicationRecord
    extend Enumerize
    enumerize :state, in: { :process => 0, :new => 1, :finished => 2, :accept => 3, :reject => 4 }, default: :reject

    validates :state, presence: true

    belongs_to :test_case, inverse_of: :test_reports
    belongs_to :user

    rails_admin do
        field :test_case
        field :user
        field :state
        field :invite_token
        field :right_count
    end
end
