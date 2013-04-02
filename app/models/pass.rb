class Pass < ActiveRecord::Base
  attr_accessible :description
  validates :description, presence: true
  attr_accessible :logoText
  validates :logoText, presence: true
  attr_accessible :serialNumber
  validates :serialNumber, presence: true
  attr_accessible :formatVersion
  validates :formatVersion, presence: true
  attr_accessible :passTypeIdentifier
  validates :passTypeIdentifier, presence: true
  attr_accessible :webServiceURL
  validates :webServiceURL, presence: true
  attr_accessible :authentificationToken
  validates :authentificationToken, presence:true
  attr_accessible :teamIdentifier
  validates :teamIdentifier, presence: true
  attr_accessible :barcode
  validates :barcode, presence: true
  attr_accessible :message
  validates :message, presence: true
  attr_accessible :format
  validates :format, presence: true
end