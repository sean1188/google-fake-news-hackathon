class AddFakeIdToCheckers < ActiveRecord::Migration[5.1]
  def change
    add_column :checkers, :fake_id, :string
    add_index :checkers, :fake_id
  end
end
