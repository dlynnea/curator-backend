class CreateMbgVerticles < ActiveRecord::Migration[6.0]
  def change
    create_table :mbg_verticles do |t|
      t.string :title
      t.string :url
      t.string :author

      t.timestamps
    end
  end
end
