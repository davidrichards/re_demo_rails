class GlobalScore < ActiveRecord::Base
  self.primary_key = "item_id"
  belongs_to :item
end
