class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :person, foreign_key: true
      t.references :item, foreign_key: true
      t.float :value
    end
  end
end
