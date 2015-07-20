class CreateImagefiles < ActiveRecord::Migration
  	def change
  		create_table :imagefiles do |t|
  			t.string :filename
  			t.string :type
  			t.string :url

  			t.timestamps
  		end
  	end
end
