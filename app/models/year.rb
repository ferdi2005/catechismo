class Year < ApplicationRecord
  has_many :subscriptions
  has_many :groups
  has_many :days
end
