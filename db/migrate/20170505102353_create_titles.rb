class CreateTitles < ActiveRecord::Migration[5.0]
  def change
    create_table :titles do |t|
      t.string :number
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
