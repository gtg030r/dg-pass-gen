class AddToPass < ActiveRecord::Migration
  def up
	create_table :passes do |t|
		t.string :passTypeIdentifier, :authenticationToken, :organizationName, :description, :logoText, :foregroundColor, :backgroundColor, :message, :key, :label, :value
	    t.attachment :logo2x, :logo2x_file_name
    end
  end

  def down
    drop_table :passes
  end
end
