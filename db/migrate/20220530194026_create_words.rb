class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :title, null: false, default: ""
      t.string :description, default: ""
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
