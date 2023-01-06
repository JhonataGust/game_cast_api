class AddUserVideoIdInComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :video_comments, :user_video
  end
end
