class CreateCheckers < ActiveRecord::Migration[5.1]
  def change
    create_table :checkers do |t|
      t.decimal :score
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
