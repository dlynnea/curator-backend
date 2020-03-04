class CreateVergeArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :verge_articles do |t|
      t.string :title
      t.string :url
      t.string :author

      t.timestamps
    end
  end
end
