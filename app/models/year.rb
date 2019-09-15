class Year < ApplicationRecord
  has_many :subscriptions
  has_many :groups
end
