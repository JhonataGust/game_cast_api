json.user_videos @user_current_videos do |user_video|
    json.uid user_video.uid
    json.image_src user_video.thumb.attached? ? polymorphic_url(user_video.thumb) : nil
end
