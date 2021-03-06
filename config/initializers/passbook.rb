require 'passbook'

Passbook.configure do |passbook|

  # Path to your wwdc cert file
  passbook.wwdc_cert = Rails.root.join('app/assets/certs/wwdrca.pem')

  # Path to your cert.p12 file
  passbook.p12_cert = Rails.root.join('app/assets/certs/pass.p12')
  
  # Password for your certificate
  passbook.p12_password = '123'

  # Other Settings
  #  passbook.notification_gateway = 'gateway.sandbox.push.apple.com'
  #  passbook.notification_cert = '/app/assets/certs/push.p12'
end
