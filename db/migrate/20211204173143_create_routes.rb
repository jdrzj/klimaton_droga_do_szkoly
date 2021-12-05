class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.float :start_lat
      t.float :start_lng

      t.float :end_lat
      t.float :end_lng

      t.string :rating
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
