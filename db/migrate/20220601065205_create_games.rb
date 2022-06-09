class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string     :title, null: false
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
    add_index :games, [:title, :user_id], unique: true
  end
end
