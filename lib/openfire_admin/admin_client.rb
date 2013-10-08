require 'openfire_admin/http_client'
require 'openfire_admin/response_exception'

module OpenfireAdmin
  # pure admin console client
  class AdminClient
    def initialize(loginurl)
      @http = HttpClient.new(URI.parse(loginurl))
    end
    def post(path, form_data, &proc); @http.post(path, form_data, &proc); end
    def get(path, &proc); @http.get(path, &proc); end

    # login
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
