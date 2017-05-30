class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.string :number
      t.references :subsection, foreign_key: true

      t.timestamps
    end
  end
end
