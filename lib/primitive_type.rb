require File.join(File.dirname(__FILE__), "type")
require File.join(File.dirname(__FILE__), "ns_type")

class PrimitiveType < Type
  class << self
    def all
      if @all.nil?
        @all = %w{short ushort int uint long float double}.map { |w| PrimitiveType.new(w) }
      end
    end
  end

  def friendly_name(capitalize_first_letter = true)
    result = @name

    case @name
    when "ushort"
      result = "unsignedShort"
    when "uint"
      result = "unsignedInt"
    end

    if capitalize_first_letter
      result = result[0, 1].capitalize + result[1..-1]
    end

    result
  end

  def reference?
    false
  end

  def declare_boxed(var)
    "NSNumber *#{var}"
  end

  def box(var)
    "[NSNumber numberWith#{friendly_name}:#{var}]"
  end

  def unbox(var)
    "[#{var} #{friendly_name(false)}Value]"
  end
end