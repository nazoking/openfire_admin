require 'spec_helper'
require 'openfire_admin'
require 'openfire_admin/util'

describe OpenfireAdmin::Util do
  it "encrypted data can decrypt same password" do
    text = "sample text"
    password="Blowfish-CBC"
    enc = OpenfireAdmin::Util.encrypt(password,text)
    dec = OpenfireAdmin::Util.decrypt(password,enc)
    dec.should eq(text)
  end
  it "can decrpt openfire value" do
    puts OpenfireAdmin::Util.decrypt("kbOPvE9jsXo83ee","c4b892d137a9f184255e258c2f1344df31b23141d49fe38bf0d0864aa3c4116f28a622daf6140bfa")
  end
  it "can decrpt openfire value" do
    puts OpenfireAdmin::Util.decrypt("kbOPvE9jsXo83ee","a8126136b524b224bef45c80a64593f215fe19f42e9a1d48d0618531521a991293073335d9b857e7")
  end
  it "can decrpt openfire value" do
    puts OpenfireAdmin::Util.decrypt("kbOPvE9jsXo83ee","2127979543e837d00a9c76b7cd8686339a9bf2c345814430c8574683858f22cf63a889f695a70276801f4269bf2589b628d923b8813f71fe82c32a70f97da42ce2480470ca8b037b468c6cd8762ee399b4024f41bbb166b9bcdde7546ad49da4330e5331bdb1fd57a41695e03740425a")
  end
end
