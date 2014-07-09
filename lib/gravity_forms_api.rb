require 'openssl'
require 'base64'
require 'cgi'

class GravityFormsAPI

  def self.generate_URL site:nil, route:nil, public_api_key:nil, private_api_key:nil, http_method:'GET'
    expires = (Time.now + 60*60).to_i # One hour.
    "http://#{site}/gravityformsapi/#{route}?api_key=#{public_api_key}&expires=#{expires}&" +
      "signature=" + generate_signature(
        api_key:public_api_key,
        private_key:private_api_key,
        http_method:http_method,
        route:route,
        expires:expires)
  end

  def self.generate_signature api_key:nil, expires:nil, http_method:nil, route:nil, private_key:nil
    CGI::escape(
      Base64.encode64(
        OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), private_key,
          [api_key, http_method, route, expires].join(':'))
      ).strip
    )
  end

end