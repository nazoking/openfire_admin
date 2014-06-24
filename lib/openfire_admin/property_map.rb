require 'openfire_admin/html_parser'
require 'openfire_admin/admin_client'
require 'openfire_admin/version_string'

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
        ta = HtmlParser.new(res.body).at('//textarea[@name="propValue"]')
        raise ResponceException.new("not found textarea",res) unless ta
        ta.text.to_s
      end
    end
    def get_properties
      ret = {}
      get("/server-properties.jsp") do |res|
        raise ResponceException.new("can't read",res) unless res.code== "200"
        doc = HtmlParser.new(res.body)
        version = VersionString.new(/Openfire ([0-9.]*)/.match(doc.at("//div[@id='jive-userstatus']").text.to_s)[1])
        if version >= "3.9.2"
          def ret.strong_hidden?
            true
          end
        else
          def ret.strong_hidden?
            false
          end
        end
        doc.search('//h1/parent::node()//table/tbody/tr[@class=""]').each do |tr|
          v = tr.at('//td[2]//span')[:title]
          v = "" if v == NBSP
          ret[tr.at('//td//span')[:title]]= v
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

    def strong_hidden?
      @cache.strong_hidden?
    end

    # get system property
    def []( name )
      v = @cache[name]
      if v.nil? and @cache.has_key?(name)
        if strong_hidden?
          :hide
        else
          @client.get_property(name)
        end
      else
        v
      end
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
