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
    has_and_belongs_to_many :categories

    has_many :test_reports, dependent: :nullify

    devise :database_authenticatable, :rememberable, :validatable

    extend Enumerize
    enumerize :role, in: { user: 0, admin: 1 }, default: :user

end
