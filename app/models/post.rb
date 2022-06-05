class Post < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validate :start_check
  validate :end_check


  def start_check
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "は今日以降の日付で選択してください")
    end
  end

  def end_check
    if (start_date.present? && end_date.present?) && (end_date < start_date || end_date < Time.current)
      errors.add(:end_date, "は開始日以降の日付で選択してください")
    end
  end
end
