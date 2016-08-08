class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.belongs_to :page, index: true, foreign_key: true
      t.string :href
      t.timestamps
    end
  end
end
