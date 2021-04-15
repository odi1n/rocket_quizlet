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

    has_and_belongs_to_many :users
end
