class RemoveColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :date_of_birth, :string
  end
end
