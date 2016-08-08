class Link < ApplicationRecord
  belongs_to :page, inverse_of: :links

  validates :href, presence: true
  validates :page_id, presence: true
end
