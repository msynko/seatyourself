class Restaurant < ApplicationRecord

  has_many :reservations
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :price_range, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true
  validates :max_capacity, presence: true
  validates :menu, presence: true



  def closing_time_display
    if closing_time > 12
      display_time = closing_time - 12
      return "#{display_time}PM"
    end
  end

end
