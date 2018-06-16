class Item < ApplicationRecord
  belongs_to :user, optional: true
  validates_presence_of :title, :description

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
