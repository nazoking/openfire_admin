require 'spec_helper'
require 'openfire_admin'

describe OpenfireAdmin::Client do
  it "can new instance" do
    OpenfireAdmin.new.should be_a_kind_of(OpenfireAdmin::Client)
  end
  describe "can operate plugins" do
    it "can read availables and do install" do
      rplugin = nil
      expect_get(OpenfireAdmin::PluginList::PLUGIN_LIST_URL, "/versions.xml" ){
        av = OpenfireAdmin.new.available_plugins
        av.should be_a_kind_of(OpenfireAdmin::PluginList)
        av.size.should be(3)
        rplugin = av["registration"]
        rplugin.should be_a_kind_of(OpenfireAdmin::AvailablePlugin)
      }

      expect_post("/dwr/exec/downloader.installPlugin.dwr",{ },
                  :body => "s0.successfull=true" ){
        rplugin.install
      }
    end
    it "can read installed plugins and do uninstall" do
      splugin = nil
      expect_get( "/plugin-admin.jsp", "/plugin-admin.jsp"){
        av = OpenfireAdmin.new.installed_plugins
        av.should be_a_kind_of(OpenfireAdmin::PluginList)
        av.size.should be(4)
        splugin = av["search"]
        splugin.should be_a_kind_of(OpenfireAdmin::InstalledPlugin)
      }

      expect_get( "/plugin-admin.jsp?deleteplugin=search",
          redirect_to("/plugin-admin.jsp?deletesuccess=true")){
        splugin.uninstall
      }

      expect_get( "/plugin-admin.jsp?reloadplugin=search",
          redirect_to("/plugin-admin.jsp?reloadsuccess=true")){
        splugin.reload
      }
      
      expect_get( "/plugin-admin.jsp?deleteplugin=search",
          redirect_to("/plugin-admin.jsp?deletesuccess=true")){
        splugin.uninstall
      }
    end
  end
  it "can login" do
    client = OpenfireAdmin.new
    client.logined?.should be_false
    expect_post( "/login.jsp",{
      "login"=>"true",
      "password"=>"bbb",
      "username"=>"aaa"},
      redirect_to("/hoge")){
      client.login("aaa","bbb")
    }
    client.logined?.should be_true
  end
  it "login fail" do
    client = OpenfireAdmin.new
    client.logined?.should be_false
    proc {
      expect_post( "/login.jsp",{
        "login"=>"true",
        "password"=>"bbb",
        "username"=>"aaa"},
        "/login-fail.jsp"){
        client.login("aaa","bbb")
      }
    }.should raise_error( OpenfireAdmin::ResponceException, /Login failed/ )
    client.logined?.should be_false
  end
  it "can operate setup mode" do
    client = OpenfireAdmin.new
    expect_get( "/login.jsp", :body=>"hoge"){
      client.setup_mode?.should be_false
    }
    expect_get( "/login.jsp", redirect_to("/setup/xxx.jsp")){
      client.setup_mode?.should be_true
    }

    w = client.setup_wizard
    w.should be_a_kind_of(OpenfireAdmin::SetupWizard)

    expect_get( "/setup/index.jsp?localeCode=en&save=Continue",
            redirect_to("/setup/xxx.jsp")) do
      w.language("en").should be_a_kind_of(OpenfireAdmin::SetupWizard)
    end

    expect_post( "/setup/setup-host-settings.jsp",{
      "continue"=>"Continue",
      "domain"=>"hoge.domain",
      "embeddedPort"=>"9090",
      "securePort"=>"9091"
    }, redirect_to("/setup/xxx.jsp")) do
      w.server("hoge.domain").should be_a_kind_of(OpenfireAdmin::SetupWizard)
    end

    expect_get( "/setup/setup-datasource-settings.jsp?next=true&mode=embedded&continue=Continue", redirect_to("/setup/xxx.jsp")) do
      w.database().should be_a_kind_of(OpenfireAdmin::SetupWizard)
    end
    expect_requests([
                    [:get, "/setup/setup-datasource-settings.jsp?next=true&mode=standard&continue=Continue", redirect_to("/setup/xxx.jsp")],
                    [:post,"/setup/setup-datasource-standard.jsp", redirect_to("/setup/xxx.jsp")]
    ]){
      w.database_standard("hoge.driver","jdbc:mysql://huge/?url","user","pass").should be_a_kind_of(OpenfireAdmin::SetupWizard)
    }
    last_post_is "connectionTimeout" => "1.0",
      "continue"=>"Continue",
      "driver"=>"hoge.driver",
      "maxConnections"=>"25",
      "minConnections"=>"5",
      "password"=>"pass",
      "serverURL"=>"jdbc:mysql://huge/?url",
      "username"=>"user"
    expect_post("/setup/setup-profile-settings.jsp",{
      "mode"=>"default", "continue"=>"Continue"
    },redirect_to("/setup/xxxx.jsp")){
      w.profile().should be_a_kind_of(OpenfireAdmin::SetupWizard)
    }
    expect_requests([
                    [:get, "/setup/setup-admin-settings.jsp", {:body=>"ok"}],
                    [:post,"/setup/setup-admin-settings.jsp", redirect_to("/setup/xxx.jsp")]
    ]){
      w.admin("em","pass").should be_a_kind_of(OpenfireAdmin::SetupWizard)
    }
    last_post_is "email"=>"em",
                 "newPassword"=>"pass",
                 "newPasswordConfirm"=>"pass",
                 "password"=>"pass"
    expect_get("/setup/setup-finished.jsp",:body => "ok"){
      w.finish()
    }
  end
  it "can operate system properties" do
    client = OpenfireAdmin.new
    s = nil
    expect_get("/server-properties.jsp","/server-properties.jsp"){
      s = client.system_properties
      s.should be_a_kind_of(OpenfireAdmin::PropertyMap)
      s["clustering.enabled"].should == "true"
      s["xmpp.socket.ssl.active"].should == "true"
      s["not.exists.key"].should be_nil
    }
    expect_post("/server-properties.jsp",{
      "edit"=>"true",
      "propName"=>"jdbcAuthProvider.passwordSQL",
    },"/server-properties_password.jsp"){
      s["jdbcAuthProvider.passwordSQL"].should == "SELECT psw as password FROM users WHERE jid = ?"
    }

    expect_post("/server-properties.jsp",{
      "save"=>"Save Property",
      "propName"=>"jdbcAuthProvider.passwordSQL",
      "propValue"=>"hoge"
    },redirect_to("/server-properties.jsp")){
      s["jdbcAuthProvider.passwordSQL"]="hoge"
    }

    expect_post("/server-properties.jsp",{
      "del"=>"true",
      "propName"=>"jdbcAuthProvider.passwordSQL"
    },redirect_to("/server-properties.jsp?deletesuccess=true")){
      s.remove "jdbcAuthProvider.passwordSQL"
    }

  end
  it "can operate system cache" do
    client = OpenfireAdmin.new
    pi = nil
    expect_get("/system-cache.jsp","/system-cache.jsp"){
      s = client.system_cache
      pi = s.find{|a| a.name=="Published Items" }
      pi.should be_a_kind_of(OpenfireAdmin::SystemCache)
    }
    expect_post("/system-cache.jsp",{
      "cacheID"=>pi.cacheID.to_str,
      "clear"=>"Clear"
    },"/system-cache_success.jsp"){
      pi.clear
    }
  end
  it "can operate users" do
    c = OpenfireAdmin.new
    c = c.users
    c.should be_a_kind_of(OpenfireAdmin::UserAdmin)

    expect_post("/user-create.jsp",{
      "create"=>"Create User",
      "email"=> "em@example.com",
      "name"=> "hoge huge",
      "password"=> "pass",
      "passwordConfirm"=>"pass",
      "username"=>"hoge" 
    },redirect_to("/uesr-create.jsp?createsuccess=true")){
      c.create("hoge","pass","hoge huge","em@example.com")
    }
    expect_get("/user-delete.jsp?username=hoge&delete=Delete+User",
              redirect_to("/user-delete.jsp?deletesuccess=true")){
      c.delete("hoge")
    }
    expect_get("/user-password.jsp?username=hoge", "ok"){
      c.exists?("hoge").should be_true
    }
    expect_get("/user-password.jsp?username=hoge", :status=>["404"]){
      c.exists?("hoge").should be_false
    }
  end
end
