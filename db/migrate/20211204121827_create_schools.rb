class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lang

      t.references :city, index: true, foreign_key: { to_table: :cities }

      t.timestamps
    end
  end
end
