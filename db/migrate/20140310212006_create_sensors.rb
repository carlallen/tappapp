class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :type
      t.integer :reading
      t.references :tap, index: true

      t.timestamps
    end
  end
end
