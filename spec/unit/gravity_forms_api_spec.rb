require 'helper.rb'

Dir['./lib/*.rb'].each {|file| require file }

RSpec.describe GravityFormsAPI do

  describe "authentication" do
    it "gets authentication signature" do
      signature = GravityFormsAPI.generate_signature(
        api_key: '1234', expires: 1369749344, http_method: 'GET', route: 'forms/1/entries',
        private_key: 'abcd')
      expect(signature).to eq('uJEnk0EoQ4d3iinjFMBrBzZfH9w%3D') # Example from the API docs.
    end
  end

end