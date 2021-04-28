# == Schema Information
#
# Table name: requests
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  category_id(Категории) :bigint           not null
#  user_id(Пользователи)  :bigint           not null
#
# Indexes
#
#  index_requests_on_category_id  (category_id)
#  index_requests_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Request < ApplicationRecord
    extend Enumerize
    enumerize :state, in: { :pending => 0, :rejected => 1, :confirmed => 2 }, default: :pending

    belongs_to :user
    belongs_to :category
    belongs_to :test_report
end
