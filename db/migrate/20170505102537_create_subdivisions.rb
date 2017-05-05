class CreateSubdivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :subdivisions do |t|
      t.string :number
      t.references :division, foreign_key: true

      t.timestamps
    end
  end
end
