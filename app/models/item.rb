class Item < ApplicationRecord
  belongs_to :user, optional: true
  validates_presence_of :title, :description

end
