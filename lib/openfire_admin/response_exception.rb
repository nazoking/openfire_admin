require 'openfire_admin/html_parser'
require 'net/http'
# openfire admin operator
module OpenfireAdmin
  # unexpected response found exception
  class ResponceException < Exception
    attr_reader :response
    def initialize(message,res)
      case res
      when Net::HTTPSuccess
        doc = HtmlParser.new(res.body)
        msgs = ( doc.search('//*[contains(@class,"jive-error-text") or contains(@class , "error")]') || [] ).map{|c| c.text.strip}
        if msgs.empty?
          super(message)
        else
          super("#{message} [#{msgs.join(' / ')}]")
        end
      when Net::HTTPRedirection
        super("#{message} redirct to=>#{res['location']}")
      when Net::HTTPNotFound
        super("#{message} Not found #{res.request.path}")
      else
        super("#{message} res.code=#{res.code}")
      end

      @response = res
    end
  end
end
