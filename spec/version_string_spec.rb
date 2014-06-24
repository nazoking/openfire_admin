require 'spec_helper'
require 'openfire_admin'
require 'openfire_admin/version_string'

describe OpenfireAdmin::VersionString do
  describe "2.4.8" do
    subject{ OpenfireAdmin::VersionString.new("2.4.8") }
    it{ should < "2.4.9" }
    it{ should == "2.4.8" }
    it{ should < "2.4.81" }
    it{ should < "2.4.8.0" }
    it{ should < "2.4.8.1" }
    it{ should < "2.4.8a" }
    it{ should > "2.4" }
    it{ should > "2.4.7" }
    it{ should > "2.4.a" }
    it{ should > nil }
    it{ should == OpenfireAdmin::VersionString.new("2.4.8") }
  end
  describe "2.4.8a" do
    subject{ OpenfireAdmin::VersionString.new("2.4.8a").should }
    it{ should < "2.4.8b" }
    it{ should < "2.4.8aa" }
    it{ should > "2.4.8" }
    it{ should == "2.4.8a" }
  end
end
