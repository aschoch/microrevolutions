class AddLanguageToUsers < ActiveRecord::Migration
  def up
		change_table :users do |t|
			t.column :language, :string
		end
	end

	def down
		change_table :users do |t|
			t.remove :language, :string
		end
	end
end
