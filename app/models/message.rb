class Message < ApplicationRecord
  belongs_to :visitor

  

  def self.matching_fullname_or_message params
    joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params}%", "%#{params}%")
  end

  def mark_read
    update(status: true) if status == false
  end
end
