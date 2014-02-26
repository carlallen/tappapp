class AddBreweryDbToBeers < ActiveRecord::Migration
  def change
    change_table :beers do |t|
      t.string :brewery_db_id
      t.string :label_url
    end
  end
end
