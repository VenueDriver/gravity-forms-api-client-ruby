require 'openssl'
require 'base64'
require 'cgi'

class GravityFormsAPI

  def self.generate_signature api_key:nil, expires:nil, http_method:nil, route:nil, private_key:nil
    CGI::escape(
      Base64.encode64(
        OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), private_key,
          [api_key, http_method, route, expires].join(':'))
      ).strip
    )
  end

end