class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.string :content_id
      t.references :document, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
