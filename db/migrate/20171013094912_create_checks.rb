class CreateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t|
      t.references :article, foreign_key: true
      t.references :checker, foreign_key: true
      t.decimal :old_score
      t.decimal :new_score

      t.timestamps
    end
  end
end
