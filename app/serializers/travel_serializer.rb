class TravelSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :summary
end
