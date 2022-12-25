class AddUidVideoPreferenceUserVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :user_videos, :uid, :string
    add_index :user_videos, :uid
  end
end
