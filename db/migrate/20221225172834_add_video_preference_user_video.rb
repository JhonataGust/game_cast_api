class AddVideoPreferenceUserVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :user_videos, :preference_type, :integer 
  end
end
