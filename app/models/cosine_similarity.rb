class CosineSimilarity < ActiveRecord::Base
  self.primary_key = :source_person_id, :target_person_id
end
