class Pass < ActiveRecord::Base
  attr_accessible :description
  validates :description, presence: true
  attr_accessible :logoText
  validates :logoText, presence: true
  attr_accessible :message
  validates :message, presence: true
  attr_accessible :organizationName
  validates :organizationName, presence: true
  attr_accessible :backgroundColor, :foregroundColor
  validates :backgroundColor, :foregroundColor, presence: true
  validates :label, :value, presence: true
  attr_accessible :label, :value

  # this is used to attach images to models using the Paperclip gem
  has_attached_file :logo2x, 
	:styles => { :original => ['58x58!', :png], :small => ['29x29!', :png] }, 
	:s3_credentials => "#{Rails.root}/config/paperclip.yml", 
	:storage => :s3,
	:bucket => "dg_pass_logos"
  
  attr_accessible :expdate
  validates :expdate, :value, presence: true
  attr_accessible :logo2x
  validates :logo2x, :value, presence: true

  ## function for defining color in rgb format
  # param: color
  ##
  def rgb(color)
    color = color.gsub(/#/, "")
	"rgb(#{color[0..1].hex},#{color[2..3].hex},#{color[4..5].hex})"
  end

  ## function for generating JSON
  # The JSON here is formatted to the specifications of a pass provided by Apple
  ##
  def toPassbookJson
  {
      formatVersion: 1,
      passTypeIdentifier: "pass.dealgenda.com",
      serialNumber:"#{self.id}",
      teamIdentifier: "RCT3MYPP47",
      barcode: {
          message: self.message,
          format: "PKBarcodeFormatPDF417",
          messageEncoding: "iso-8859-1"
      },
      organizationName: self.organizationName,
      description: "coupon",
      logoText: self.logoText,
      foregroundColor: self.rgb(self.foregroundColor),
      backgroundColor: self.rgb(self.backgroundColor),
      coupon: {
        primaryFields: [
          {
            key: "offer",
			      label: self.label,
            value: self.value
          }
        ],
        auxiliaryFields: [
          {
            key: "expires",
            label: "EXPIRES",
            value: self.expdate,
            isRelative: true,
            dateStyle: "PKDateStyleShort"
          }
        ],
        backFields: [
          {
            label: "details",
            key: "Details",
            value: self.description
         }
        ]
      }
    }
  end

end
