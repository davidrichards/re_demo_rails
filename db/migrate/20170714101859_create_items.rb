class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :description
      t.string :url
      t.string :avatar_url
    end
  end
end
