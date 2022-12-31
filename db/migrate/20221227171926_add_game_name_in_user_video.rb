class AddGameNameInUserVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :user_videos, :game_name, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
