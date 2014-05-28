require 'rexml/document'
require 'rehtml'
module OpenfireAdmin
  # REXML Element extention. like nokogiri
  module ElementHelper
    # find first element by xpath
    # @param [String] xpath
    # @return [REXML::Element extends ElementHelper]
    def at(xpath)
      xpath = ".#{xpath}" if !self.is_a?(REXML::Document) and xpath =~ /^\//
      elm = REXML::XPath.first(self,xpath)
      elm.extend(ElementHelper)
      elm
    end

    # find elements by xpath
    # @param [String] xpath
    # @return [Array<REXML::Element extends ElementHelper>]
    def search(xpath)
      xpath = ".#{xpath}" if !self.is_a?(REXML::Document) and xpath =~ /^\//
      ret = REXML::XPath.match(self,xpath).map{|elm|
        elm.extend(ElementHelper)
        elm
        block_given? ? (yield elm) : elm
      }
    end

    # find element attribute
    # @param [Symbol] attribute name
    # @return [String|nil]
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
    # parse html and build xml
    # @param [String] html
    def initialize(html)
      @doc = REHTML.to_rexml(html)
      @doc.extend(ElementHelper)
    end

    # find elements by xpath
    # @param [String] xpath
    # @return [Array<REXML::Element extends ElementHelper>]
    def search(xpath, &proc)
      @doc.search(xpath, &proc)
    end

    # find first element by xpath
    # @param [String] xpath
    # @return [REXML::Element extends ElementHelper]
    def at(xpath)
      @doc.at(xpath)
    end
  end
end

