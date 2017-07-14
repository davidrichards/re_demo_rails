class Person < ApplicationRecord
  has_many :scores
  has_many :items, through: :scores
end
