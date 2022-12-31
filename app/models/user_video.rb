class UserVideo < ApplicationRecord
  before_create :make_uid

  belongs_to :user

  has_one_attached :file_video
  has_one_attached :thumb
end
