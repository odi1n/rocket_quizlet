# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  email(Email)                        :string           default(""), not null
#  encrypted_password(Password)        :string           default(""), not null
#  invite_token(Пригласительный токен) :boolean          default(FALSE)
#  lastname(Фамилия пользователя)      :string           default(""), not null
#  remember_created_at                 :datetime
#  username(Имя пользователя)          :string           default(""), not null
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
    extend Enumerize

    enumerize :role, in: { user: 0, admin: 1 }, default: :user

    devise :database_authenticatable, :rememberable, :validatable, password_length: 6..128 # валидация пароля

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    validates :lastname, presence: true

    has_and_belongs_to_many :categories
    has_many :test_reports, dependent: :nullify

    rails_admin do
        object_label_method :get_name
    end

    def get_name
        "# #{id} - #{email}"
    end
end
