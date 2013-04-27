class AddToPass < ActiveRecord::Migration
  def up
	create_table :passes do |t|
		t.string :passTypeIdentifier, :authenticationToken, :organizationName, :description, :logoText, :foregroundColor, :backgroundColor, :message, :label, :value
		t.datetime :expdate
	end
  add_attachment :passes, :logo2x
  add_attachment :passes, :apass
  
  end

  def down
    remove_attachment :passes, :logo2x
    remove_attachment :passes, :apass
    drop_table :passes
  end
end
