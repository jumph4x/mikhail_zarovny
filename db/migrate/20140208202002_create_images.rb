class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.integer :year
      t.string :discipline
      t.string :subject_matter
      t.string :dimensions
      t.text :keywords
      t.text :description
      t.string :upload

      t.timestamps
    end
  end
end
