class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :rating, index: true

      t.references :rateable, polymorphic: true, index: true
      t.timestamps null: false
    end
    add_foreign_key :rates, :rating
  end
end
