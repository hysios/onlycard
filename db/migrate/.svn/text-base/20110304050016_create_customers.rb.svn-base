class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
			t.string :last_name
			t.string :first_name
			t.decimal :money, :precision => 10, :scale => 2
			t.integer :cast_count
			t.integer :delta_count
			
			
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
