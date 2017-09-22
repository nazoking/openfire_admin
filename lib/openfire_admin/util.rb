require "openssl"
require 'digest/sha1'
 
module OpenfireAdmin
  module Util
    def self.bin2hex(bin)
      bin.unpack('H*').first
    end
    def self.hex2bin(str)
      [str].pack('H*')
    end
    class Chiper
      def initialize(type)
        @cipher = OpenSSL::Cipher.new(type)
      end
      def enc(key,bin)
        cipher = @cipher.encrypt
        cipher.key = key
        cipher.update(bin) << cipher.final
      end
      def dec(key,bin)
        cipher = @cipher.decrypt
        cipher.key = key
        cipher.update(bin) << cipher.final
      end
    end
    def self.sha1(str)
      Digest::SHA1.hexdigest(str)
    end
    def self.encrypt(key, str)
      bin2hex(Chiper.new('bf-cbc').enc(sha1(key),str))
    end
    def self.str_as_utf8(str)
      str.force_encoding(Encoding::UTF_8)
      str
    end

    def self.decrypt(key, enc)
      str_as_utf8(Chiper.new('bf-cbc').dec(sha1(key),hex2bin(enc)))
    end
  end
end

