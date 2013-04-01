class Pass < ActiveRecord::Base
  attr_accessible :description
  validates :description, presence: true
  attr_accessible :logoText
  validates :logoText, presence: true
  attr_accessible :serialNumber
  validates :serialNumber, presence: true
end