class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.float :lat
      t.float :lang
      t.float :radius
      t.string :name

      t.timestamps
    end
  end
end
