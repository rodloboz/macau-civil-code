class CreateSubsections < ActiveRecord::Migration[5.0]
  def change
    create_table :subsections do |t|
      t.string :number
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
