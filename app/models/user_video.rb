class UserVideo < ApplicationRecord
  before_create :make_uid

  belongs_to :user
end
