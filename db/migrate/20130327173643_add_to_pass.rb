class AddToPass < ActiveRecord::Migration
  def up
	create_table :passes do |t|
		t.string :passTypeIdentifier, :webServiceURL, :authenticationToken, :teamIdentifier, :organizationName, :description, :logoText, :foregroundColor, :backgroundColor, :serialNumber, :message, :offer, :value
		t.string :colorFormat, :colorFormat2, :colorFormat3
		t.integer :fR, :fG, :fB
		t.integer :bR, :bG, :bB

  end
end

  def down
	drop_table :passes
  end
end
