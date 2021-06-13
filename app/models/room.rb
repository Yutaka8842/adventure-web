class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :schedules, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :overview
    validates :leader
  end
end