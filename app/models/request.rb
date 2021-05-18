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

    belongs_to :user
    belongs_to :category
    belongs_to :test_report

    extend Enumerize
    enumerize :state, in: { pending: 0, rejected: 1, confirmed: 2 }, default: :pending

    after_save :send_message, if: -> { changed? }

    state_machine :state, initial: :pending do
        after_transition on: :confirm, do: :test

        event :reject do
            transition pending: :rejected
        end
        event :confirm do
            transition pending: :confirmed
        end

        event :in_process do
            transition all => :pending
        end

        # state :pending, value: 0
        # state :rejected, value: 1
        # state :confirmed, value: 2
    end

    def test
        puts "asdasdasdasd"
    end

    def send_message
        CategoryMailer.open_email(self.user, self.test_report).deliver_now
    end

    rails_admin do
        list do
            field :state, :state
            field :user
            field :category
            field :test_report
        end
        edit do
            field :state, :state
            field :user
            field :category
            field :test_report
        end
        show do
            field :state
            field :user
            field :category
            field :test_report
        end
        state({
                  events: { reject: 'btn-danger', in_process: 'btn-warning', confirm: 'btn-success' },
                  states: { rejected: 'label-important', pending: 'label-warning', confirmed: 'label-success' }
              })
    end
end
