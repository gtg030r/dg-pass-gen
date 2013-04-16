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
  attr_accessible :icon, :icon2x, :logo, :logo2x

  has_attached_file :icon, styles: {
	display: '58x58>'
  }

 
  has_attached_file :icon2x
 
  has_attached_file :logo, styles: {
	display: '158x50>'
  }   
 
  has_attached_file :logo2x

  def rgb(color)
    color = color.gsub(/#/, "")
	"rgb(#{color[0..1].hex},#{color[2..3].hex},#{color[4..5].hex})"
  end

  def toPassbookJson
  {
      formatVersion: 1,
      passTypeIdentifier: "pass.com.DealGenda.generic",
      serialNumber:"#{self.id}",
      webServiceURL: "https:\/\/www.DealGenga.com",
      authenticationToken: "vxwxd7J8AlNNFPS8k0a0FfUFtq0ewzFdc",
      teamIdentifier: "RCT3MYPP47",
      barcode: {
          message: self.message,
          format: "PKBarcodeFormatPDF417",
          messageEncoding: "iso-15420"
      },
      organizationName: self.organizationName,
      description: self.description,
      logoText: self.logoText,
      foregroundColor: self.rgb(self.foregroundColor),
      backgroundColor: self.rgb(self.backgroundColor),
      generic: {
        primaryFields: [
          {
            key: "offer",
			      label: self.label,
            value: self.value
          }
        ],
        secondaryFields: [
          {
            key: "subtitle",
            label: "MEMBER SINCE",
            value: "2012"
          }
        ],
        auxiliaryFields: [
          {
            key: "level",
            label: "LEVEL",
            value: "Platinum"
          },
          {
            key: "favorite",
            label: "FAVORITE TOY",
            value: "Bucky Ball Magnets",
            textAlignment: "PKTextAlignmentRight"
          }
        ],
        backFields: [
          {
            numberStyle: "PKNumberStyleSpellOut",
            label: "spelled out",
            key: "numberStyle",
            value: 200
          },
          {
            label: "in Reals",
            key: "currency",
            value: 200,
            currencyCode: "BRL"
          },
          {
            dateStyle: "PKDateStyleFull",
            label: "full date",
            key: "dateFull",
            value: "1980-05-07T10:00-05:00"
          },
          {
            label: "full time",
            key: "timeFull",
            value: "1980-05-07T10:00-05:00",
            timeStyle: "PKDateStyleFull"
          },
          {
            dateStyle: "PKDateStyleShort",
            label: "short date and time",
            key: "dateTime",
            value: "1980-05-07T10:00-05:00",
            timeStyle: "PKDateStyleShort"
          },
          {
            dateStyle: "PKDateStyleShort",
            label: "relative date",
            key: "relStyle",
            value: "2013-04-24T10:00-05:00",
            isRelative: true
          }
        ]
      }
    }
  end

end
