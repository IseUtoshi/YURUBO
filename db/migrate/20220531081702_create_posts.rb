class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.datetime   :start_time, null: false
      t.datetime   :end_time,   null: false
      t.integer    :chat_id,    null: false
      t.integer    :publish_id, null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
