class AddToPass < ActiveRecord::Migration
  def up
	create_table :passes do |t|
		t.string :passTypeIdentifier, :webServiceURL, :authenticationToken, :teamIdentifier, :organizationName, :description, :logoText, :foregroundColor, :backgroundColor, :serialNumber
		t.column :barcode, :barcode
		t.column :generic, :generic
  end
end

  def down
	drop_table :passes
  end
end
