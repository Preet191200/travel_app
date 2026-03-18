class CreateAttractions < ActiveRecord::Migration[8.1]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
