class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.belongs_to :page, index: true, foreign_key: true
      t.integer :type
      t.text :content
      t.timestamps
    end
  end
end
