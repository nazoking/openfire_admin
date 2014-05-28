require 'rubygems'
begin
  require 'coveralls'
  Coveralls.wear!
rescue LoadError
end

require 'bundler/setup'
require 'openfire_admin'
require 'fakeweb'

unless URI.respond_to?(:decode_www_form) # for ruby 1.8
  require File.dirname(__FILE__)+"/uri_backport" 
end


module FakeWebHelper
  def path_of(url)
    "http://localhost:9090#{url}"
  end
  def fixture(path)
    File.join(File.dirname(__FILE__),"fixtures",path)
  end
  def read_fixture(path)
    open(fixture(path)).read
  end
  def redirect_to(path)
    {
      :status=>["302"],
      :location=>path
    }
  end
  def register_uri(method,url,option)
    url = path_of(url) if url =~ %r[^/]
    if option.is_a?(String)
      if option =~ %r[^/]
        option = { :body => read_fixture(option) }
      else
        option = { :body => option }
      end
    end
    FakeWeb.register_uri(method,url,option)
  end
  def get_last_form
    Hash[URI.decode_www_form(FakeWeb.last_request.body)]
  end
  def last_post_is form_values
    FakeWeb.last_request.should be_a_kind_of(Net::HTTP::Post)
    begin
      ex = get_last_form
      ex.should include(form_values)
    rescue RSpec::Expectations::ExpectationNotMetError => e
      ret = [e.message]
      form_values.keys.each{|k|
        unless form_values[k]==ex[k]
          if ex[k].nil?
            ret << "#{k}: '#{form_values[k]}' != nil"
          else
            ret << "#{k}: '#{form_values[k]}' != '#{ex[k]}'"
          end
        end
      }
      raise RSpec::Expectations::ExpectationNotMetError.new( "#{ret.join("\n")}")
    end
  end
  def access
    FakeWeb.clean_registry
    FakeWeb.last_request = nil
    FakeWeb.allow_net_connect = false
    ret = yield
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = true
    ret
  end
  def expect_get(path,option)
    access{
      register_uri(:get,path,option)
      ret = yield
      FakeWeb.last_request.should be_a_kind_of(Net::HTTP::Get)
      ret
    }
  end
  def expect_post(path,form_values,option)
    access{
      register_uri(:post,path,option)
      ret = yield
      last_post_is form_values
      ret
    }
  end
  def expect_requests(expects)
    access{
      expects.each{|ex| register_uri(*ex) }
      yield
    }
  end
end

RSpec.configure do |config|
  config.include FakeWebHelper
end
