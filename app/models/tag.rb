class Tag < ApplicationRecord
  # disable STI
  self.inheritance_column = :_type_disabled

  belongs_to :page, inverse_of: :tags

  enum type: { h1: 0, h2: 1, h3: 2 }

  validates :content, presence: true
  validates :page_id, presence: true
end
