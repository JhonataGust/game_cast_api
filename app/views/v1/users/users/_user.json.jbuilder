json.uid user.uid
json.name user.name
json.username "@#{user.username}"
json.preferences user.preferences.nil? ? [] : user.preferences
json.profile_url user.avatar.attached? ? polymorphic_url(user.avatar) : nil
json.email user.email