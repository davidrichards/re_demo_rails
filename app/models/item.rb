class Item < ApplicationRecord
  has_one :global_score
  has_many :scores
  has_many :people, through: :scores
end
