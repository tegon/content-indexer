class Page < ApplicationRecord
  has_many :tags, inverse_of: :page

  validates :url, presence: true, uniqueness: true
end
