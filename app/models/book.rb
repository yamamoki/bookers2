class Book < ApplicationRecord
has_one_attached :image
belongs_to :user

scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }
validates :body, presence: true
validates :title, presence: true
validates :body,
      length: { maximum: 200 }

end