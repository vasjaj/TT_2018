class User < ApplicationRecord
  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    return true if role == "admin"
    false
  end
end
