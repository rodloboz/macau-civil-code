class AddSubtitletoChapter < ActiveRecord::Migration[5.0]
  def change
    add_reference :chapters, :subtitle, index: true
    add_foreign_key :chapters, :subtitles
  end
end
