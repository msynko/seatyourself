class Restaurant < ApplicationRecord

  has_many :reservations
  belongs_to :user

  def closing_time_display
    if closing_time > 12
      display_time = closing_time - 12
      return "#{display_time}PM"
    end
  end

end
