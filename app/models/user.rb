class User < ApplicationRecord
  has_many :subscriptions
  has_many :days
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :username, uniqueness: true
  def email_required?
    false
  end
  def will_save_change_to_email?
    false
  end

end
