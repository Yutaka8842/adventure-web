class Schedule < ApplicationRecord
  belongs_to :room

  with_options presence: true do
    validates :date
    validates :detail
  end
end
