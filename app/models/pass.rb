class Pass < ActiveRecord::Base
  attr_accessible :description
  validates :description, presence: true
  attr_accessible :logoText
  validates :logoText, presence: true
  attr_accessible :serialNumber
  validates :serialNumber, presence: true
  attr_accessible :message
  validates :message, presence: true
  attr_accessible :organizationName
  validates :organizationName, presence: true
  attr_accessible :fR, :fG, :fB
  validates :fR, :fG, :fB, presence: true
  attr_accessible :bR, :bG, :bB
  validates :fR, :fG, :fB, presence: true
  attr_accessible :colorFormat, :colorFormat2, :colorFormat3

  def toPassbookJson
  {
      formatVersion: 1,
      passTypeIdentifier: "",
      serialNumber: self.serialNumber,
      webServiceURL: "https://www.DealGenga.com",
      authenticationToken: "vxwxd7J8AlNNFPS8k0a0FfUFtq0ewzFdc",
      teamIdentifier: "RCT3MYPP47",
      barcode: {
          message: self.message,
          format: "PKBarcodeFormatPDF417",
          messageEncoding: "iso-8859-1"
      },
      organizationName: self.organizationName,
      description: self.description,
      logoText: self.logoText,
      foregroundColor: self.colorFormat.to_s + self.fR.to_s + self.colorFormat2.to_s + self.fG.to_s + self.colorFormat2.to_s + self.fB.to_s + self.colorFormat3.to_s,
      backgroundColor: self.colorFormat.to_s + self.bR.to_s + self.colorFormat2.to_s + self.bG.to_s + self.colorFormat2.to_s + self.bB.to_s + self.colorFormat3.to_s,
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
