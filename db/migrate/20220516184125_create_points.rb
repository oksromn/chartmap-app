class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.float :value, null: false
      t.string :point_symbol, default: ""
      t.string :description, default: ""
      t.timestamp :date, null: false
      t.references :chart
      
      t.timestamps
    end
  end
end
