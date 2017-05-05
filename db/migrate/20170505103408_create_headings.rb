class CreateHeadings < ActiveRecord::Migration[5.0]
  def change
    create_table :headings do |t|
      t.text :pt
      t.references :article, foreign_key: true
      t.references :book, foreign_key: true
      t.references :title, foreign_key: true
      t.references :subtitle, foreign_key: true
      t.references :chapter, foreign_key: true
      t.references :section, foreign_key: true
      t.references :subsection, foreign_key: true
      t.references :division, foreign_key: true
      t.references :subdivision, foreign_key: true

      t.timestamps
    end
  end
end
