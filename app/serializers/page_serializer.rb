class PageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :links
  has_many :tags
end
