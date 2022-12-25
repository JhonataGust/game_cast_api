class CreateUserVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_videos do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end