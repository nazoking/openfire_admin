require 'openfire_admin/http_client'
require 'openfire_admin/response_exception'

module OpenfireAdmin
  # admin console client
  class AdminClient
    # @param [String] loginurl  admin console url. ex "http://localhost:9090/"
    def initialize(loginurl)
      @http = HttpClient.new(URI.parse(loginurl))
    end
    # http post.
    # @param [String] path  post url path
    # @param [Hash<String,String>] form_data post form data
    # @yield [Net::HTTPResponse]
    def post(path, form_data, &proc); @http.post(path, form_data, &proc); end

    # http get.
    # @param [String] path  post url path
    # @param [Hash<String,String>] form_data post form data
    # @yield [Net::HTTPResponse]
    def get(path, &proc); @http.get(path, &proc); end

    # login
    # @param [String] username admin user name
    # @param [String] pass admin user password
    def login(username, pass)
      post( "/login.jsp" , {
          "login"=> "true",
          "password"=>pass,
          "url"=>"/index.jsp",
          "username"=>username}) do |res|
        raise ResponceException.new("can't login",res) unless res.code == "302"
      end
    end
  end
end
