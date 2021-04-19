# == Schema Information
#
# Table name: categories
#
#  id                        :bigint           not null, primary key
#  title(Название категории) :string
#
class Category < ApplicationRecord
    validates :title, presence: true
    validates_associated :users
    validates_associated :tests

    has_many :tests
    has_many :questions

    has_and_belongs_to_many :users

    rails_admin do
        field :title
        field :tests
        field :users
    end
end
