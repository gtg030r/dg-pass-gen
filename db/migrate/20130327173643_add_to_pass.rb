class AddToPass < ActiveRecord::Migration
  def up
	create_table :passes do |t|
		t.string :passTypeIdentifier, :authenticationToken, :organizationName, :description, :logoText, :foregroundColor, :backgroundColor, :message, :key, :label, :value
    end
  add_column :passes, :logo2x_file_name, :string
  add_column :passes, :logo2x_content_type, :string
  add_column :passes, :logo2x_file_size, :integer
  add_column :passes, :logo2x_updated_at, :datetime
  
  end

  def down
    remove_attachment :passes, :logo2x
    drop_table :passes
  end
end
