class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :url, :summary
end
