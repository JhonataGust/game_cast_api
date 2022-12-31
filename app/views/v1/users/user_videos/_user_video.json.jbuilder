json.uid user_video.uid
json.name user_video.name
json.game_name user_video.game_name
json.description user_video.description
json.reacted UserVideoReaction.where(reference_type: UserVideo.to_s, reference_id: user_video.id, user_id: @user.id).empty? ? false : true
json.reactions UserVideoReaction.where(reference_type: UserVideo.to_s, reference_id: user_video.id).count
json.link_video user_video.file_video.attached? ? polymorphic_url(user_video.file_video) : nil
json.image_src user_video.thumb.attached? ? polymorphic_url(user_video.thumb) : nil
json.type_video user_video.uid == @current_url
json.muted user_video.uid == @current_url
json.user do
    json.name user_video.user.name
    json.username "@#{user_video.user.username}"
    json.avatar user_video.user.avatar.attached? ? polymorphic_url(user_video.user.avatar) : nil 
end
