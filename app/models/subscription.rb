class Subscription < ApplicationRecord
  belongs_to :person
  belongs_to :year
  belongs_to :group, optional: true
  belongs_to :day
end
