class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
  
  def template
    ApplicationController.renderer.render partial: 'rooms/message', locals: { message: self }
  end
end
