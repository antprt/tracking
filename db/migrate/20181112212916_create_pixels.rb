class CreatePixels < ActiveRecord::Migration[5.0]
  def change
    create_table :pixels do |t|
      t.string :name
      t.integer :conversions, default: 0
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
