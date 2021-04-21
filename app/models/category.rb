# == Schema Information
#
# Table name: categories
#
#  id                        :bigint           not null, primary key
#  title(Название категории) :string
#
class Category < ApplicationRecord
    validates :title, presence: true

    has_many :test_cases
    has_many :questions

    has_and_belongs_to_many :users

    rails_admin do
        field :title
        field :test_cases
        field :users
    end
end
