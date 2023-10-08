class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16 }
  validates :blockname, length: { maximum: 50 }, allow_blank: true
  validates :blockname2, length: { maximum: 50 }, allow_blank: true
  validates :blockname3, length: { maximum: 50 }, allow_blank: true
  validate :end_date_after_start_date

  def is_active_on?(date)
    start_date <= date && date <= end_date
  end

  private

  def end_date_after_start_date
    if end_date && start_date && end_date < start_date
      errors.add(:end_date, "は開始日より後の日付を選択してください")
    end
  end
end