class Task < ApplicationRecord
  def is_active_on?(date)
    start_date <= date && date <= end_date
  end

end