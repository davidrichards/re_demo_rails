class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :token
    end
    add_index :people, :token
  end
end
