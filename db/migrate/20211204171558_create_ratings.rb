class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :description
      t.float :lat
      t.float :lng
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.string :status, default: "pending"
      t.integer :likes, default: 1
      t.timestamps
    end
  end
end
