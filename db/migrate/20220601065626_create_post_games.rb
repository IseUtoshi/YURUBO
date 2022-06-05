class CreatePostGames < ActiveRecord::Migration[6.0]
  def change
    create_table :post_games do |t|
      t.references :post, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.timestamps
    end
  end
end
