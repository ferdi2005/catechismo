class Day < ApplicationRecord
  has_many :subscriptions
  belongs_to :user
  validate :day_check

  def day_check
    if Day.where(user: user).any?
      return false
    end
  end
end
