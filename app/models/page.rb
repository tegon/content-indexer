class Page < ApplicationRecord
  has_many :tags, inverse_of: :page, dependent: :destroy
  has_many :links, inverse_of: :page, dependent: :destroy

  validates :url, presence: true, uniqueness: true
  validates :url, format: { with: URI.regexp }, if: -> { url.present? }
end
