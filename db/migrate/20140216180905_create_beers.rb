class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.references :brewery
      t.integer :ibu, default: 0, null: false
      t.integer :srm, default: 0, null: false
      t.decimal :abv, default: 0, null: false, precision: 3, scale: 1

      t.timestamps
    end
  end
end
