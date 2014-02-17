class CreateTaps < ActiveRecord::Migration
  def change
    create_table :taps do |t|
      t.references :beer, index: true

      t.timestamps
    end
  end
end
