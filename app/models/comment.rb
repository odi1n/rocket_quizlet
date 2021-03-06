# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id                      :bigint           not null, primary key
#  commentable_type        :string
#  text(Текст комментария) :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  commentable_id          :bigint
#  user_id(Пользователи)   :bigint           not null
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
    validates :text, presence: true
    belongs_to :commentable, polymorphic: true

    rails_admin do
        # field :commentable
        # field :user
        field :text
    end
end
