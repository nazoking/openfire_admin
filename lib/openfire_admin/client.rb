require 'open-uri'
require 'openfire_admin/admin_client'
require 'openfire_admin/setup_wizard'
require 'openfire_admin/plugin'
require 'openfire_admin/property_map'

module OpenfireAdmin
  def self.new(loginurl="http://localhost:9090")
    Client.new(loginurl)
  end

  # HighLevel client
  class Client
    attr_reader :client
    # constructor
    def initialize(loginurl="http://localhost:9090")
      @client = AdminClient.new(loginurl)
    end

    def setup_mode?
      @client.get("/login.jsp") do |res|
        res.code == "302" and res["location"] =~ %r"/setup/"
      end
    end

    def setup_wizard
      SetupWizard.new(@client)
    end

    def logined?
      @logined
    end

    def login(username, password)
      @client.login(username, password)
      @logined = true
    end

    # get properties
    def system_properties
      PropertyMap.new(@client)
    end

    # return SystemCache array
    def system_cache
      @client.system_cache.map{|c| SystemCache.new( @client, c[:cacheID], c[:name] )}
    end

    # plugins list array of available plugins.
    # if you need not installed plugins, ( self.available_plugins - self.install_plugin )
    def available_plugins
      PluginList.availables(@client)
    end

    # plugins list array of installed plugins
    def installed_plugins
      PluginList.installed(@client)
    end
    def users
      UserAdmin.new(@client)
    end
  end
end
