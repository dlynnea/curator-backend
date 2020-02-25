require 'csv'

Article.destroy_all

CSV.foreach('archive.csv', headers: true) do |row|
    Article.create(
        title: row['title'],
        author: row['author'],
        url: row['url'],
        summary: row['summary'],
    ) 
end

