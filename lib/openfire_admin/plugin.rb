require 'nokogiri'
require 'openfire_admin/admin_client'

module OpenfireAdmin
  class AdminClient
    def get_installed_plugins
      get("/plugin-admin.jsp") do |res|
        doc =Nokogiri::HTML(res.body)
        doc.at('h1').parent.at('table').search('tbody tr[valign=top]').map do |tr|
          img = tr.at('a[href*="reloadplugin="]')
          if img
            {
              :key => img[:href].match(/\?reloadplugin=([^"'&>]*)/)[1],
              :name => tr.search('td')[1].content.gsub(NBSP,' ').strip,
              :description => tr.search('td')[3].content.strip,
              :version => tr.search('td')[4].content.strip
            }
          end
        end
      end
    end
    def install_plugin(url)
      post("/dwr/exec/downloader.installPlugin.dwr",
        "callCount"=>"1",
        "c0-scriptName"=>"downloader",
        "c0-methodName"=>"installPlugin",
        "c0-id"=>"0",
        "c0-param0"=>"string:#{url}",
        "c0-param1"=>"string:14867746",
        "xml"=>"true" ) do |res|
        raise ResponceException.new("plugin install fail",res) unless res.code == "200" and res.body =~ /s0\.successfull=/
      end
    end
    def reload_plugin(key)
      get("/plugin-admin.jsp?reloadplugin=#{key}") do |res|
        raise ResponceException.new("cant reload",res) if res.code != "302" or res['location'] !~ /reloadsuccess=true/
      end
    end
    def uninstall_plugin(key)
      get("/plugin-admin.jsp?deleteplugin=#{key}") do |res|
        raise ResponceException.new("cant delete",res) if res.code != "302" or res['location'] !~ /deletesuccess=true/
      end
    end
  end
  # plugin abstract class
  class Plugin
    attr_accessor :name, :description, :version
    attr_reader :key
    def initialize(client, key)
      @client = client
      @key = key.downcase
    end
    def inspect
      to_s
    end
    def to_s
      "#<#{self.class} #{key} #{version} (#{name.inspect} #{description.inspect})>"
    end
    def eql?(obj)
      case obj
      when Plugin
        self.key == obj.key
      when String
        self.key == obj.downcase
      else
        false
      end
    end
  end

  # installed plugin. this instance can uninstall and reload
  class InstalledPlugin < Plugin
    # reload plugin
    def reload
      @client.reload_plugin(key)
    end

    # uninstall plugin
    def uninstall
      @client.uninstall_plugin(key)
    end
  end

  # available plugin. this can install
  class AvailablePlugin < Plugin
    attr_accessor :url

    # install plugin
    def install
      @client.install_plugin(url)
    end

  end

  # plugin list array. this can find plugin by key.
  class PluginList < Array
    def [](name)
      if name.is_a?(String)
        self.find{|p| p.eql? name }
      else
        super
      end
    end

    def self.installed(client)
      ret = PluginList.new
      client.get_installed_plugins.each{|p|
        r = InstalledPlugin.new(client, p[:key])
        r.name = p[:name]
        r.description = p[:description]
        r.version = p[:version]
        ret << r
      }
      ret
    end
    PLUGIN_LIST_URL= "http://www.igniterealtime.org/projects/openfire/versions.jsp"
    def self.availables(client, xml=nil)
      xml = open(PLUGIN_LIST_URL).read unless xml
      ret = PluginList.new
      doc = Nokogiri::XML(xml)
      doc.search('plugin').each do |tr|
        p = AvailablePlugin.new(client, tr[:url].match(/\/([^\.\/]+)\.[^\/.]+$/)[1])
        p.name = tr[:name]
        p.description = tr[:description]
        p.version = tr[:latest]
        p.url = tr[:url]
        ret << p
      end
      ret
    end
  end
end
