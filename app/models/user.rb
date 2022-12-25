class User < ApplicationRecord
  before_create :make_uid

  has_secure_password

  validates :name, presence: true, on: create
  validates :email, presence: true, on: create
  validates :password, presence: true, on: create
  validates :username, presence: true, on: create

  has_one_attached :avatar


  def self.preferences_type
    [
      'Gameplays',
      'Game Edits',
      'Speed Runs',
      'Short Videos'
    ]
  end
end
