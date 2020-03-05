class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.string :title
      t.string :url
      t.string :summary

      t.timestamps
    end
  end
end
