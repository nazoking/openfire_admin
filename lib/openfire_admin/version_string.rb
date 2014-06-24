module OpenfireAdmin
  class VersionString
    def initialize(version)
      @version = version.to_s.strip.split(/\./)
    end
    def <=>(othre)
      compare(@version.dup, othre.kind_of?(VersionString) ? othre.to_a.dup : othre.to_s.strip.split(/\./))
    end
    def > other
      (self <=> other) == 1
    end
    def < other
      (self <=> other) == -1
    end
    def >= other
      (self <=> other) >= 0
    end
    def <= other
      (self <=> other) <= 0
    end
    def == other
      (self <=> other) == 0
    end
    def to_s
      "VersionString(#{@version.join(".")})"
    end
    def to_a
      @version
    end
    private
    def compare(me,othre)
      m = me.shift
      o = othre.shift
      if m.nil?
        return o.nil? ? 0 : -1
      elsif o.nil?
        return 1
      end
      md = m.to_i
      od = o.to_i
      rd = md <=> od
      if rd == 0
        m.sub!(/^\d*/,'')
        o.sub!(/^\d*/,'')
        rd = m <=> o
        rd = compare(me,othre) if rd == 0
      end
      rd
    end
  end
end
