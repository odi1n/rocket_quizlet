# == Schema Information
#
# Table name: categories
#
#  id                        :bigint           not null, primary key
#  title(Название категории) :string
#
class Category < ApplicationRecord
    has_and_belongs_to_many :users

    has_many :tests
end
