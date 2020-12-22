class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :organizer_id, foreign_key: "user_id"
      t.datetime :date
      t.string :title
      t.text :body
      t.string :location

      t.timestamps
    end
  end
end
