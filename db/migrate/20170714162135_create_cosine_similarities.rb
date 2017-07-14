class CreateCosineSimilarities < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW cosine_similarities AS
        WITH norms AS (
          SELECT
            person_id,
            sum(value * value) AS weight_squared
          FROM scores
          GROUP BY person_id
        )
        SELECT
          x.person_id AS source_person_id,
          y.person_id AS target_person_id,
          nx.weight_squared AS x_squared,
          ny.weight_squared AS y_squared,
          sum(x.value * y.value) AS inner_product,
          sum(x.value * y.value) / sqrt(nx.weight_squared * ny.weight_squared) AS cosine_similarity
        FROM scores AS x
        JOIN scores AS y
          ON (x.item_id = y.item_id)
        JOIN norms AS nx
          ON (nx.person_id = x.person_id)
        JOIN norms AS ny
          ON ny.person_id = y.person_id
        WHERE x.person_id < y.person_id
        GROUP BY 1,2,3,4
        ORDER BY 6 DESC
    SQL
  end

  def down
    execute "DROP VIEW cosine_similarities"
  end
end
