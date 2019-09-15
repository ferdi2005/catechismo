class Person < ApplicationRecord
  belongs_to :group, optional: true
  has_many :subscriptions
end
