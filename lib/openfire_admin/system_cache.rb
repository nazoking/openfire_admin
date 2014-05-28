require 'openfire_admin/html_parser'
require 'openfire_admin/admin_client'

module OpenfireAdmin
  # extend for system cache
  class AdminClient
    def system_cache
      get("/system-cache.jsp") do |res|
        HtmlParser.new(res.body).search('//input[@type="checkbox"][@name="cacheID"]'){|i|
          {
            :cacheID => i[:value],
            :name => i.at("ancestor::tr[1]//table[1]//td[2]").text.strip
          }
        }
      end
    end
    def system_cache_clear(cacheID)
      post("/system-cache.jsp","cacheID"=>cacheID, "clear"=>"Clear") do |res|
        ! HtmlParser.new(res.body).at("//div[@class='jive-success']").nil?
      end
    end
  end
  # cache control. this instance can clear cache.
  class SystemCache
    attr_reader :cacheID, :name
    def initialize(client, cacheID, name)
      @client = client
      @cacheID = cacheID
      @name = name
    end
    def to_s
      "#<#{self.class} (#{@cacheID})#{name.inspect}>"
    end
    # clear cache
    def clear
      @client.system_cache_clear( @cacheID )
    end
  end
end
