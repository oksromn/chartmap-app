class CreateCharts < ActiveRecord::Migration[7.0]
  def change
    create_table :charts do |t|
      t.string :title, null: false, default: ""
      t.string :chart_type, null: false, default: ""
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
