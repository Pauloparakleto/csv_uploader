class CreateCsvExtractorFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_extractor_files do |t|

      t.timestamps
    end
  end
end
