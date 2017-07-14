class CreateGlobalScores < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW global_scores AS
        SELECT
          item_id, average_score, score_count
        FROM
          items, (
            SELECT
              value AS average_score,
              count(person_id) AS score_count,
              item_id
            FROM
              scores
            GROUP BY
              item_id
            ORDER BY
              average_score DESC
          ) AS average_score_by_items
          WHERE items.id = average_score_by_items.item_id
          ORDER BY
            average_score DESC
    SQL
  end

  def down
    # execute "DROP VIEW global_scores"
  end
  # round(avg(value),1) AS average_score,
end
