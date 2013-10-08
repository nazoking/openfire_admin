require 'nokogiri'
require 'openfire_admin/admin_client'

module OpenfireAdmin
  class AdminClient
    def remove_property(name)
      post('/server-properties.jsp', 'propName' => name, 'del'=>'true') do |res|
        raise ResponceException.new("cant save",res) if res.code != "302" or res['location'] !~ /deletesuccess=true$/
      end
    end
    def set_property(name, value)
      post('/server-properties.jsp', 'propName' => name, 'propValue'=>value.to_s, 'save'=>'Save Property') do |res|
        raise ResponceException.new("cant save",res) if res.code != "302"
      end
    end
    def get_property(name)
      post("/server-properties.jsp", "edit"=>"true", "propName"=>name) do |res|
        ta = Nokogiri::HTML(res.body).at('textarea[name=propValue]')
        raise ResponceException.new("not found textarea",res) unless ta
        ta.content.to_s
      end
    end
    def get_properties
      ret = {}
      get("/server-properties.jsp") do |res|
        raise ResponceException.new("can't read",res) unless res.code== "200"
        doc = Nokogiri::HTML(res.body)
        doc.search('//h1/parent::node()//table/tbody/tr[@class=""]').each do |tr|
          v = tr.at('td[2] span')[:title]
          v = "" if v == NBSP
          ret[tr.at('td span')[:title]]= v
        end
      end
      ret
    end
  end
  # System property map
  class PropertyMap
    def initialize(client)
      @client = client
      reload
    end

    def inspect
      @cache.inspect
    end

    # get system property
    def []( name )
      v = @cache[name]
      v = @client.get_property(name) if v.nil? and @cache.has_key?(name)
      v
    end

    # reload cache
    def reload
      @cache = @client.get_properties
      self
    end

    # remove property
    def remove(name)
      @client.remove_property(name)
    end

    # set/add property
    def []=(name,value)
      if value.nil?
        remove(name)
      else
        @client.set_property(name, value)
        @cache[name]=value
      end
    end
  end
end
