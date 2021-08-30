class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
