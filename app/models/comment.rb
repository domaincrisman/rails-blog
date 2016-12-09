Rails.application.config.active_record.belongs_to_required_by_default = false
class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :visitor, optional: true
  has_many :notifications, as: :notifiable, dependent: :destroy

  scope :approved, -> { where status: true }

  def self.matching_fullname_or_message params
    Post.joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params}%", "%#{params}%")
  end
end
