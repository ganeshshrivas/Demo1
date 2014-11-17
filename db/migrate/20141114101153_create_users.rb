class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :country
    	t.string :date_of_birth
    	t.string :mobile
      t.timestamps
    end
  end
end
