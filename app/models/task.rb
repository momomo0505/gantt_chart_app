class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16 }
  validates :blockname, length: { maximum: 50 }, allow_blank: true
  validates :blockname2, length: { maximum: 50 }, allow_blank: true
  validates :blockname3, length: { maximum: 50 }, allow_blank: true

  def is_active_on?(date)
    start_date <= date && date <= end_date
  end
end