require 'nokogiri'
require 'openfire_admin/admin_client.rb'

module OpenfireAdmin
  # extend for system cache
  class AdminClient
    def system_cache
      get("/system-cache.jsp") do |res|
        Nokogiri::HTML(res.body).search('input[type=checkbox][name=cacheID]').map{|i|
          {
            :cacheID => i[:value],
            :name => i.ancestors("tr").first.search("td td")[1].content.strip
          }
        }
      end
    end
    def system_cache_clear(cacheID)
      post("/system-cache.jsp","cacheID"=>cacheID, "clear"=>"Clear") do |res|
        ! Nokogiri::HTML(res.body).at("div[class='jive-success']").nil?
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
