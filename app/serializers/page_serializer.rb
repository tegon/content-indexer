class PageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :links, if: -> { instance_options[:include_associations] }
  has_many :tags, if: -> { instance_options[:include_associations] }
end
