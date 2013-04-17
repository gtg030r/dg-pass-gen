class AddToPass < ActiveRecord::Migration
  def up
	create_table :passes do |t|
		t.string :passTypeIdentifier, :authenticationToken, :organizationName, :description, :logoText, :foregroundColor, :backgroundColor, :message, :key, :label, :value
	end
    add_attachment :passes, :logo2x
  end

  def down
	drop_table :passes
	remove_attachment :passes, :logo2x
  end
end
