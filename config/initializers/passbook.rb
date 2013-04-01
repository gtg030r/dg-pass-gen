require 'passbook'

Passbook.configure do |passbook|

  # Path to your wwdc cert file
  passbook.wwdc_cert = ''

  # Path to your cert.p12 file
  passbook.p12_cert = ''
  
  # Password for your certificate
  passbook.p12_password = ''
end
