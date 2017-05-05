class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.text :en
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.references :heading, foreign_key: true

      t.timestamps
    end
  end
end
