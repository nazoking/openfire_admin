require 'rexml/document'
require 'rehtml'
module OpenfireAdmin
  module ElementHelper
    def at(xpath)
      xpath = ".#{xpath}" if !self.is_a?(REXML::Document) and xpath =~ /^\//
      elm = REXML::XPath.first(self,xpath)
      elm.extend(ElementHelper)
      elm
    end
    def search(xpath)
      xpath = ".#{xpath}" if !self.is_a?(REXML::Document) and xpath =~ /^\//
      ret = REXML::XPath.match(self,xpath).map{|elm|
        elm.extend(ElementHelper)
        elm
        block_given? ? (yield elm) : elm
      }
    end
    def [](arg, name=nil)
      if arg.is_a?(Symbol)
        self.attributes[arg.to_s]
      else
        super
      end
    end
  end
  # html parser wrapper
  class HtmlParser
    def initialize(html)
      @doc = REHTML.to_rexml(html)
      @doc.extend(ElementHelper)
    end
    def search(xpath, &proc)
      @doc.search(xpath, &proc)
    end
    def at(xpath)
      @doc.at(xpath)
    end
  end
end

