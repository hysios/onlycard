class CreateCasts < ActiveRecord::Migration
  def self.up
    create_table :casts do |t|
			t.integer :customer_id
			t.decimal :money, :precision => 10, :scale => 2
			t.timestamp :cast_time
			t.integer :location_id
			t.string :remark
		
    end
  end

  def self.down
    drop_table :casts
  end
end
