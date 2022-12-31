class CreateUserVideoReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_video_reactions do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_reference  :user_video_reactions, :reference,  polymorphic: true, index: true
  end
end
