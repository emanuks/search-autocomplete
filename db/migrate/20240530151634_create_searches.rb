class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.string :query
      t.integer :quantity
      t.belongs_to :user

      t.timestamps
    end
  end
end
