require 'openfire_admin/http_client.rb'

module OpenfireAdmin
  class UserAdmin
    def initialize(client)
      @client = client
    end
    def create(username,password,name,email,isadmin=false)
      params = {
        "create"=>"Create User",
        "email"=> email,
        "name"=> name,
        "password"=> password,
        "passwordConfirm"=>password,
        "username"=>username }
      params['isadmin'] = "on" if isadmin
      @client.post("/user-create.jsp", params ) do |res|
        raise ResponceException.new("can't create user #{username}",res ) unless res.code == "302" and res["location"] =~ /success=true/
      end
    end
    def delete(username)
      @client.get("/user-delete.jsp?username=#{username}&delete=Delete+User") do |res|
        raise ResponceException.new("can't delete user #{username}",res ) unless res.code == "302" and res["location"] =~ /deletesuccess=true/
      end
    end
    def exists?(username)
      @client.get("/user-password.jsp?username=#{username}") do |res|
        res.code == "200"
      end
    end
  end
end
