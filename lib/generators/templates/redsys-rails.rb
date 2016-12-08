# config/initializers/redsys-rails.rb
# 
# Los siguientes valores son proporcionados por su entidad financiera.
# Se recomienda guardar la clave para la firma en el secrets.yml.
#
# => url: Url TPV
# => sha_256_key: clave para firma HMAC SHA256
# => merchant_code: código de comercio
# => merchant_terminal: código Terminal
# => merchant_transaction_type: tipo de transacción
# => merchant_currency: divisa (978: euro, 840: dólares, 826: libras, 392: yenes)
# => signature_version: versión firma HMAC SHA256
#

if Rails.env.production?
  Rails.configuration.redsys_rails = { 
    "gateway_dollar_name_1" => {
      url: '',
      sha_256_key: '',
      merchant_code: '',
      merchant_terminal: '',
      merchant_transaction_type: '',
      merchant_currency: '840', # currency = $
      signature_version: 'HMAC_SHA256_V1'
    },
    "gateway_euro_name_2" => {
      url: '',
      sha_256_key: '',
      merchant_code: '',
      merchant_terminal: '',
      merchant_transaction_type: '',
      merchant_currency: '978', # currency = €
      signature_version: 'HMAC_SHA256_V1'      
    } 
  }
else
  Rails.configuration.redsys_rails = {
    "gateway_dollar_name_1" => {
      url: '',
      sha_256_key: '',
      merchant_code: '',
      merchant_terminal: '',
      merchant_transaction_type: '',
      merchant_currency: '840', # currency = $
      signature_version: 'HMAC_SHA256_V1'
    },
    "gateway_euro_name_2" => {
      url: '',
      sha_256_key: '',
      merchant_code: '',
      merchant_terminal: '',
      merchant_transaction_type: '',
      merchant_currency: '978', # currency = €
      signature_version: 'HMAC_SHA256_V1'      
    }   
  }    
end