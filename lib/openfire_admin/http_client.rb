require 'net/http'
module OpenfireAdmin
  # simple http client ( cookie support )
  class HttpClient
    # @param [URI] url  admin console uri. HttpClient use its host , port and scheme
    def initialize(url)
      @cookies = {}
      @url = url
      requrie 'net/https' if @url.scheme == 'https'
    end

    # @param [Net::HTTPRequest] request
    # @yield [Net::HTTPResponse]
    def request(req)
      Net::HTTP.start(@url.host, @url.port) do |http|
        http.use_ssl = true if @url.scheme == 'https'
        puts "#{req.method} #{req.path}" if @verbos
        req['Host'] = @url.host
        req['Cookie'] = @cookies.map{|k,v| "#{k}=#{v}"}.join(";") unless @cookies.empty?
        res = http.request(req)
        cookies = res.get_fields('Set-Cookie')
        cookies.each{|str|
          k,v = str[0...str.index(';')].split('=')
          @cookies[k] = v
        } if cookies
        if @verbos
          puts "#{res.code} #{res.message}"
          res.each{|k,v| puts "#{k}=#{v}" }
        end
        def res.request
          @request
        end
        res.instance_variable_set(:@request, req)
        yield res
      end
    end

    # post with form data
    # @param [String] request path
    # @param [Hash<String,String>] form data
    # @yield [Net::HTTPResponse]
    def post(path, form_data)
      req = Net::HTTP::Post.new(path)
      req.set_form_data(form_data)
      request(req){|res| yield res }
    end

    # get path
    # @param [String] request path
    # @yield [Net::HTTPResponse]
    def get(path)
      request(Net::HTTP::Get.new(path)){|res| yield res }
    end
  end
end
