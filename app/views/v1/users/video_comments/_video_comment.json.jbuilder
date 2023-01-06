json.text_comment video_comment.text_comment
json.user do
        json.name video_comment.user.name
        json.username "@#{video_comment.user.username}"
        json.avatar video_comment.user.avatar.attached? ? polymorphic_url(video_comment.user.avatar) : nil 
end