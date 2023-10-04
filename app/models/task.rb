class Task < ApplicationRecord
  validates :name, presence: true
  validates :blockname, length: { maximum: 10 }, allow_blank: true

  def is_active_on?(date)
    start_date <= date && date <= end_date
  end
end