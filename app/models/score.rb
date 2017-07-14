class Score < ApplicationRecord
  belongs_to :person
  belongs_to :item
end
