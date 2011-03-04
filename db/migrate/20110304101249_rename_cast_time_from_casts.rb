class RenameCastTimeFromCasts < ActiveRecord::Migration
  def self.up
  	rename_column :casts, :cast_time, :casttime_on
  	change_column :casts, :casttime_on, :timestamp, :default => Time.now
  end

  def self.down
  	rename_column :casts, :casttime_on , :cast_time
  end
end
