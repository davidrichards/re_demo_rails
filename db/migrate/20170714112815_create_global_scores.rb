class CreateGlobalScores < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW global_scores AS
        WITH average_score_by_items AS (
          SELECT
            avg(value) AS average_score,
            count(person_id) AS score_count,
            item_id
          FROM scores
          GROUP BY item_id
        ) SELECT
            item_id, average_score, score_count
          FROM items
          JOIN average_score_by_items ON items.id = average_score_by_items.item_id
    SQL
  end

  def down
    execute "DROP VIEW global_scores"
  end
end
