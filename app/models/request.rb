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

    after_save :send_message, if: :changed?

    state_machine :state, initial: :pending do
        event :confirmed do
            print "xxxxxx"
        end
        # after_transition :on => :confirmed, :do => :tow
    end

    def send_message
        CategoryMailer.open_email(self.user, self.test_report).deliver_now
    end

    # def tow
    #     print "xxxxxx"
    # end

    belongs_to :user
    belongs_to :category
    belongs_to :test_report

    rails_admin do
        field :user
        field :category
        field :test_report
        field :state
    end
end
