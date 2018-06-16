class Keyword < ApplicationRecord
  belongs_to :item
  validates_presence_of :word, :item
end
