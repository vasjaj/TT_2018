class User < ApplicationRecord
  before_save :audit_logs

  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    return true if role == "admin"
    false
  end

  def audit_logs
    if changed?
      #binding.pry
      log = Log.new
      #log.changed_by = current_user
      log.changed_at = Time.now
      log.field = changes.to_s
      log.save!
      binding.pry
    end
  end
end
