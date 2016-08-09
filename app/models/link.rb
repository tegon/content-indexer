class Link < ApplicationRecord
  belongs_to :page, inverse_of: :links

  validates :href, presence: true
  validates :href, format: { with: URI.regexp }, if: -> { href.present? }
  validates :page_id, presence: true
end
