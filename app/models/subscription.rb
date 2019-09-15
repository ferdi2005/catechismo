class Subscription < ApplicationRecord
  belongs_to :person
  belongs_to :year
  belongs_to :group
  belongs_to :day
end
